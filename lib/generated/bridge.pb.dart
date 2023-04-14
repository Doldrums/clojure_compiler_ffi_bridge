///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'bridge.pbenum.dart';

export 'bridge.pbenum.dart';

enum Token_Value {
  symbol,
  keyword,
  string,
  number,
  nil,
  true_7,
  false_8,
  list,
  notSet
}

class Token extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Token_Value> _Token_ValueByTag = {
    2: Token_Value.symbol,
    3: Token_Value.keyword,
    4: Token_Value.string,
    5: Token_Value.number,
    6: Token_Value.nil,
    7: Token_Value.true_7,
    8: Token_Value.false_8,
    9: Token_Value.list,
    0: Token_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Token',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9])
    ..e<TokenType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: TokenType.TT_SYMBOL,
        valueOf: TokenType.valueOf,
        enumValues: TokenType.values)
    ..aOM<TokenSymbol>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'symbol',
        subBuilder: TokenSymbol.create)
    ..aOM<TokenKeyword>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyword',
        subBuilder: TokenKeyword.create)
    ..aOM<TokenString>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'string',
        subBuilder: TokenString.create)
    ..aOM<TokenNumber>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'number',
        subBuilder: TokenNumber.create)
    ..aOM<TokenNil>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nil',
        subBuilder: TokenNil.create)
    ..aOM<TokenTrue>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'true',
        subBuilder: TokenTrue.create)
    ..aOM<TokenFalse>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'false',
        subBuilder: TokenFalse.create)
    ..aOM<TokenList>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        subBuilder: TokenList.create)
    ..hasRequiredFields = false;

  Token._() : super();
  factory Token({
    TokenType? type,
    TokenSymbol? symbol,
    TokenKeyword? keyword,
    TokenString? string,
    TokenNumber? number,
    TokenNil? nil,
    TokenTrue? true_7,
    TokenFalse? false_8,
    TokenList? list,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (keyword != null) {
      _result.keyword = keyword;
    }
    if (string != null) {
      _result.string = string;
    }
    if (number != null) {
      _result.number = number;
    }
    if (nil != null) {
      _result.nil = nil;
    }
    if (true_7 != null) {
      _result.true_7 = true_7;
    }
    if (false_8 != null) {
      _result.false_8 = false_8;
    }
    if (list != null) {
      _result.list = list;
    }
    return _result;
  }
  factory Token.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) =>
      super.copyWith((message) => updates(message as Token))
          as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  Token_Value whichValue() => _Token_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TokenType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TokenType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  TokenSymbol get symbol => $_getN(1);
  @$pb.TagNumber(2)
  set symbol(TokenSymbol v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);
  @$pb.TagNumber(2)
  TokenSymbol ensureSymbol() => $_ensure(1);

  @$pb.TagNumber(3)
  TokenKeyword get keyword => $_getN(2);
  @$pb.TagNumber(3)
  set keyword(TokenKeyword v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKeyword() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyword() => clearField(3);
  @$pb.TagNumber(3)
  TokenKeyword ensureKeyword() => $_ensure(2);

  @$pb.TagNumber(4)
  TokenString get string => $_getN(3);
  @$pb.TagNumber(4)
  set string(TokenString v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasString() => $_has(3);
  @$pb.TagNumber(4)
  void clearString() => clearField(4);
  @$pb.TagNumber(4)
  TokenString ensureString() => $_ensure(3);

  @$pb.TagNumber(5)
  TokenNumber get number => $_getN(4);
  @$pb.TagNumber(5)
  set number(TokenNumber v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumber() => clearField(5);
  @$pb.TagNumber(5)
  TokenNumber ensureNumber() => $_ensure(4);

  @$pb.TagNumber(6)
  TokenNil get nil => $_getN(5);
  @$pb.TagNumber(6)
  set nil(TokenNil v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNil() => $_has(5);
  @$pb.TagNumber(6)
  void clearNil() => clearField(6);
  @$pb.TagNumber(6)
  TokenNil ensureNil() => $_ensure(5);

  @$pb.TagNumber(7)
  TokenTrue get true_7 => $_getN(6);
  @$pb.TagNumber(7)
  set true_7(TokenTrue v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTrue_7() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrue_7() => clearField(7);
  @$pb.TagNumber(7)
  TokenTrue ensureTrue_7() => $_ensure(6);

  @$pb.TagNumber(8)
  TokenFalse get false_8 => $_getN(7);
  @$pb.TagNumber(8)
  set false_8(TokenFalse v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFalse_8() => $_has(7);
  @$pb.TagNumber(8)
  void clearFalse_8() => clearField(8);
  @$pb.TagNumber(8)
  TokenFalse ensureFalse_8() => $_ensure(7);

  @$pb.TagNumber(9)
  TokenList get list => $_getN(8);
  @$pb.TagNumber(9)
  set list(TokenList v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasList() => $_has(8);
  @$pb.TagNumber(9)
  void clearList() => clearField(9);
  @$pb.TagNumber(9)
  TokenList ensureList() => $_ensure(8);
}

class TokenSymbol extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenSymbol',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  TokenSymbol._() : super();
  factory TokenSymbol({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TokenSymbol.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenSymbol.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenSymbol clone() => TokenSymbol()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenSymbol copyWith(void Function(TokenSymbol) updates) =>
      super.copyWith((message) => updates(message as TokenSymbol))
          as TokenSymbol; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenSymbol create() => TokenSymbol._();
  TokenSymbol createEmptyInstance() => create();
  static $pb.PbList<TokenSymbol> createRepeated() => $pb.PbList<TokenSymbol>();
  @$core.pragma('dart2js:noInline')
  static TokenSymbol getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenSymbol>(create);
  static TokenSymbol? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class TokenKeyword extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenKeyword',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  TokenKeyword._() : super();
  factory TokenKeyword({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TokenKeyword.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenKeyword.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenKeyword clone() => TokenKeyword()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenKeyword copyWith(void Function(TokenKeyword) updates) =>
      super.copyWith((message) => updates(message as TokenKeyword))
          as TokenKeyword; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenKeyword create() => TokenKeyword._();
  TokenKeyword createEmptyInstance() => create();
  static $pb.PbList<TokenKeyword> createRepeated() =>
      $pb.PbList<TokenKeyword>();
  @$core.pragma('dart2js:noInline')
  static TokenKeyword getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenKeyword>(create);
  static TokenKeyword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TokenString extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenString',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  TokenString._() : super();
  factory TokenString({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TokenString.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenString.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenString clone() => TokenString()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenString copyWith(void Function(TokenString) updates) =>
      super.copyWith((message) => updates(message as TokenString))
          as TokenString; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenString create() => TokenString._();
  TokenString createEmptyInstance() => create();
  static $pb.PbList<TokenString> createRepeated() => $pb.PbList<TokenString>();
  @$core.pragma('dart2js:noInline')
  static TokenString getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenString>(create);
  static TokenString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TokenNumber extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenNumber',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  TokenNumber._() : super();
  factory TokenNumber({
    $core.double? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TokenNumber.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenNumber.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenNumber clone() => TokenNumber()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenNumber copyWith(void Function(TokenNumber) updates) =>
      super.copyWith((message) => updates(message as TokenNumber))
          as TokenNumber; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenNumber create() => TokenNumber._();
  TokenNumber createEmptyInstance() => create();
  static $pb.PbList<TokenNumber> createRepeated() => $pb.PbList<TokenNumber>();
  @$core.pragma('dart2js:noInline')
  static TokenNumber getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenNumber>(create);
  static TokenNumber? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TokenNil extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenNil',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TokenNil._() : super();
  factory TokenNil() => create();
  factory TokenNil.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenNil.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenNil clone() => TokenNil()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenNil copyWith(void Function(TokenNil) updates) =>
      super.copyWith((message) => updates(message as TokenNil))
          as TokenNil; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenNil create() => TokenNil._();
  TokenNil createEmptyInstance() => create();
  static $pb.PbList<TokenNil> createRepeated() => $pb.PbList<TokenNil>();
  @$core.pragma('dart2js:noInline')
  static TokenNil getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenNil>(create);
  static TokenNil? _defaultInstance;
}

class TokenTrue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenTrue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TokenTrue._() : super();
  factory TokenTrue() => create();
  factory TokenTrue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenTrue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenTrue clone() => TokenTrue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenTrue copyWith(void Function(TokenTrue) updates) =>
      super.copyWith((message) => updates(message as TokenTrue))
          as TokenTrue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenTrue create() => TokenTrue._();
  TokenTrue createEmptyInstance() => create();
  static $pb.PbList<TokenTrue> createRepeated() => $pb.PbList<TokenTrue>();
  @$core.pragma('dart2js:noInline')
  static TokenTrue getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenTrue>(create);
  static TokenTrue? _defaultInstance;
}

class TokenFalse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenFalse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TokenFalse._() : super();
  factory TokenFalse() => create();
  factory TokenFalse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenFalse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenFalse clone() => TokenFalse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenFalse copyWith(void Function(TokenFalse) updates) =>
      super.copyWith((message) => updates(message as TokenFalse))
          as TokenFalse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenFalse create() => TokenFalse._();
  TokenFalse createEmptyInstance() => create();
  static $pb.PbList<TokenFalse> createRepeated() => $pb.PbList<TokenFalse>();
  @$core.pragma('dart2js:noInline')
  static TokenFalse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenFalse>(create);
  static TokenFalse? _defaultInstance;
}

class TokenList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TokenList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'bridge'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startSymbol')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endSymbol')
    ..pc<Token>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: Token.create)
    ..hasRequiredFields = false;

  TokenList._() : super();
  factory TokenList({
    $core.String? startSymbol,
    $core.String? endSymbol,
    $core.Iterable<Token>? list,
  }) {
    final _result = create();
    if (startSymbol != null) {
      _result.startSymbol = startSymbol;
    }
    if (endSymbol != null) {
      _result.endSymbol = endSymbol;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory TokenList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TokenList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TokenList clone() => TokenList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TokenList copyWith(void Function(TokenList) updates) =>
      super.copyWith((message) => updates(message as TokenList))
          as TokenList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenList create() => TokenList._();
  TokenList createEmptyInstance() => create();
  static $pb.PbList<TokenList> createRepeated() => $pb.PbList<TokenList>();
  @$core.pragma('dart2js:noInline')
  static TokenList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenList>(create);
  static TokenList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startSymbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set startSymbol($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStartSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get endSymbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set endSymbol($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Token> get list => $_getList(2);
}
