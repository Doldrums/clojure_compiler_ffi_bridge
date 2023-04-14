///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TokenType extends $pb.ProtobufEnum {
  static const TokenType TT_SYMBOL = TokenType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_SYMBOL');
  static const TokenType TT_KEYWORD = TokenType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_KEYWORD');
  static const TokenType TT_STRING = TokenType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_STRING');
  static const TokenType TT_NUMBER = TokenType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_NUMBER');
  static const TokenType TT_NIL = TokenType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_NIL');
  static const TokenType TT_TRUE = TokenType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_TRUE');
  static const TokenType TT_FALSE = TokenType._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_FALSE');
  static const TokenType TT_LIST = TokenType._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TT_LIST');

  static const $core.List<TokenType> values = <TokenType>[
    TT_SYMBOL,
    TT_KEYWORD,
    TT_STRING,
    TT_NUMBER,
    TT_NIL,
    TT_TRUE,
    TT_FALSE,
    TT_LIST,
  ];

  static final $core.Map<$core.int, TokenType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TokenType? valueOf($core.int value) => _byValue[value];

  const TokenType._($core.int v, $core.String n) : super(v, n);
}
