///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tokenTypeDescriptor instead')
const TokenType$json = const {
  '1': 'TokenType',
  '2': const [
    const {'1': 'TT_SYMBOL', '2': 0},
    const {'1': 'TT_KEYWORD', '2': 1},
    const {'1': 'TT_STRING', '2': 2},
    const {'1': 'TT_NUMBER', '2': 3},
    const {'1': 'TT_NIL', '2': 4},
    const {'1': 'TT_TRUE', '2': 5},
    const {'1': 'TT_FALSE', '2': 6},
    const {'1': 'TT_LIST', '2': 7},
  ],
};

/// Descriptor for `TokenType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tokenTypeDescriptor = $convert.base64Decode(
    'CglUb2tlblR5cGUSDQoJVFRfU1lNQk9MEAASDgoKVFRfS0VZV09SRBABEg0KCVRUX1NUUklORxACEg0KCVRUX05VTUJFUhADEgoKBlRUX05JTBAEEgsKB1RUX1RSVUUQBRIMCghUVF9GQUxTRRAGEgsKB1RUX0xJU1QQBw==');
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.bridge.TokenType',
      '10': 'type'
    },
    const {
      '1': 'symbol',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenSymbol',
      '9': 0,
      '10': 'symbol'
    },
    const {
      '1': 'keyword',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenKeyword',
      '9': 0,
      '10': 'keyword'
    },
    const {
      '1': 'string',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenString',
      '9': 0,
      '10': 'string'
    },
    const {
      '1': 'number',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenNumber',
      '9': 0,
      '10': 'number'
    },
    const {
      '1': 'nil',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenNil',
      '9': 0,
      '10': 'nil'
    },
    const {
      '1': 'true',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenTrue',
      '9': 0,
      '10': 'true'
    },
    const {
      '1': 'false',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenFalse',
      '9': 0,
      '10': 'false'
    },
    const {
      '1': 'list',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.bridge.TokenList',
      '9': 0,
      '10': 'list'
    },
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode(
    'CgVUb2tlbhIlCgR0eXBlGAEgASgOMhEuYnJpZGdlLlRva2VuVHlwZVIEdHlwZRItCgZzeW1ib2wYAiABKAsyEy5icmlkZ2UuVG9rZW5TeW1ib2xIAFIGc3ltYm9sEjAKB2tleXdvcmQYAyABKAsyFC5icmlkZ2UuVG9rZW5LZXl3b3JkSABSB2tleXdvcmQSLQoGc3RyaW5nGAQgASgLMhMuYnJpZGdlLlRva2VuU3RyaW5nSABSBnN0cmluZxItCgZudW1iZXIYBSABKAsyEy5icmlkZ2UuVG9rZW5OdW1iZXJIAFIGbnVtYmVyEiQKA25pbBgGIAEoCzIQLmJyaWRnZS5Ub2tlbk5pbEgAUgNuaWwSJwoEdHJ1ZRgHIAEoCzIRLmJyaWRnZS5Ub2tlblRydWVIAFIEdHJ1ZRIqCgVmYWxzZRgIIAEoCzISLmJyaWRnZS5Ub2tlbkZhbHNlSABSBWZhbHNlEicKBGxpc3QYCSABKAsyES5icmlkZ2UuVG9rZW5MaXN0SABSBGxpc3RCBwoFdmFsdWU=');
@$core.Deprecated('Use tokenSymbolDescriptor instead')
const TokenSymbol$json = const {
  '1': 'TokenSymbol',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TokenSymbol`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenSymbolDescriptor =
    $convert.base64Decode('CgtUb2tlblN5bWJvbBISCgRuYW1lGAEgASgJUgRuYW1l');
@$core.Deprecated('Use tokenKeywordDescriptor instead')
const TokenKeyword$json = const {
  '1': 'TokenKeyword',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `TokenKeyword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenKeywordDescriptor =
    $convert.base64Decode('CgxUb2tlbktleXdvcmQSFAoFdmFsdWUYASABKAlSBXZhbHVl');
@$core.Deprecated('Use tokenStringDescriptor instead')
const TokenString$json = const {
  '1': 'TokenString',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `TokenString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenStringDescriptor =
    $convert.base64Decode('CgtUb2tlblN0cmluZxIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use tokenNumberDescriptor instead')
const TokenNumber$json = const {
  '1': 'TokenNumber',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `TokenNumber`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenNumberDescriptor =
    $convert.base64Decode('CgtUb2tlbk51bWJlchIUCgV2YWx1ZRgBIAEoAVIFdmFsdWU=');
@$core.Deprecated('Use tokenNilDescriptor instead')
const TokenNil$json = const {
  '1': 'TokenNil',
};

/// Descriptor for `TokenNil`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenNilDescriptor =
    $convert.base64Decode('CghUb2tlbk5pbA==');
@$core.Deprecated('Use tokenTrueDescriptor instead')
const TokenTrue$json = const {
  '1': 'TokenTrue',
};

/// Descriptor for `TokenTrue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTrueDescriptor =
    $convert.base64Decode('CglUb2tlblRydWU=');
@$core.Deprecated('Use tokenFalseDescriptor instead')
const TokenFalse$json = const {
  '1': 'TokenFalse',
};

/// Descriptor for `TokenFalse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenFalseDescriptor =
    $convert.base64Decode('CgpUb2tlbkZhbHNl');
@$core.Deprecated('Use tokenListDescriptor instead')
const TokenList$json = const {
  '1': 'TokenList',
  '2': const [
    const {'1': 'start_symbol', '3': 1, '4': 1, '5': 9, '10': 'startSymbol'},
    const {'1': 'end_symbol', '3': 2, '4': 1, '5': 9, '10': 'endSymbol'},
    const {
      '1': 'list',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.bridge.Token',
      '10': 'list'
    },
  ],
};

/// Descriptor for `TokenList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenListDescriptor = $convert.base64Decode(
    'CglUb2tlbkxpc3QSIQoMc3RhcnRfc3ltYm9sGAEgASgJUgtzdGFydFN5bWJvbBIdCgplbmRfc3ltYm9sGAIgASgJUgllbmRTeW1ib2wSIQoEbGlzdBgDIAMoCzINLmJyaWRnZS5Ub2tlblIEbGlzdA==');
