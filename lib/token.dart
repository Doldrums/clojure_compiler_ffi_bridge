import 'package:clojure_compiler_ffi_bridge/generated/bridge.pb.dart' as pb;

enum TokenType { symbol, keyword, string, number, nil, bool, list, unknown }

abstract class Token {
  final TokenType type;

  Token(this.type);

  factory Token.fromPbToken(pb.Token token) {
    switch (token.type) {
      case pb.TokenType.TT_FALSE:
        return BoolToken(false);
      case pb.TokenType.TT_TRUE:
        return BoolToken(true);
      case pb.TokenType.TT_KEYWORD:
        return KeywordToken(token.keyword.value);
      case pb.TokenType.TT_LIST:
        return ListToken(
          token.list.startSymbol,
          token.list.endSymbol,
          token.list.list.map(Token.fromPbToken).toList(),
        );
      case pb.TokenType.TT_NIL:
        return NilToken();
      case pb.TokenType.TT_NUMBER:
        return NumberToken(token.number.value);
      case pb.TokenType.TT_STRING:
        return StringToken(token.string.value);
      case pb.TokenType.TT_SYMBOL:
        return SymbolToken(token.symbol.name);
    }

    return UnknownToken();
  }

  Map toJson() {
    return {
      'type': type.name,
    };
  }
}

class UnknownToken extends Token {
  UnknownToken() : super(TokenType.unknown);
}

class SymbolToken extends Token {
  final String name;

  SymbolToken(this.name) : super(TokenType.symbol);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'value': name,
    };
  }
}

class KeywordToken extends Token {
  final String value;

  KeywordToken(this.value) : super(TokenType.keyword);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'value': value,
    };
  }
}

class StringToken extends Token {
  final String value;

  StringToken(this.value) : super(TokenType.string);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'value': value,
    };
  }
}

class NumberToken extends Token {
  final double value;

  NumberToken(this.value) : super(TokenType.number);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'value': value,
    };
  }
}

class NilToken extends Token {
  NilToken() : super(TokenType.nil);
}

class BoolToken extends Token {
  final bool value;

  BoolToken(this.value) : super(TokenType.bool);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'value': value,
    };
  }
}

class ListToken extends Token {
  final String lParen;
  final String rParen;
  final List<Token> body;

  ListToken(this.lParen, this.rParen, this.body) : super(TokenType.list);

  @override
  Map toJson() {
    return {
      'type': type.name,
      'lParen': lParen,
      'rParen': rParen,
      'body': body.map((token) => token.toJson()).toList(),
    };
  }
}
