import 'dart:convert';
import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart';

final listEquals = const DeepCollectionEquality().equals;

extension CString on String {
  Pointer<Char> toCString(Allocator alloc) {
    return toNativeUtf8(allocator: alloc).cast();
  }
}

extension CStringArray on List<String> {
  Pointer<Pointer<Char>> toCStringArray(Allocator alloc) {
    final array = alloc<Pointer<Char>>(length + 1);
    for (var i = 0; i < length; ++i) {
      array[i] = this[i].toCString(alloc);
    }
    array[length] = nullptr;
    return array;
  }
}

extension CStringMap on Map<String, String> {
  Pointer<Pointer<Char>> toCStringMap(Allocator alloc) {
    final array = alloc<Pointer<Char>>(length + 1);
    final entries = this.entries.toList();
    for (var i = 0; i < entries.length; ++i) {
      final element = '${entries[i].key}=${entries[i].value}';
      array[i] = element.toCString(alloc);
    }
    array[length] = nullptr;
    return array;
  }
}

extension CharPointerString on Pointer<Char> {
  String? toDartString({int? length}) {
    if (this == nullptr) return null;
    return cast<Utf8>().toDartString(length: length);
  }
}

extension CharPointerPointerString on Pointer<Pointer<Char>> {
  List<String> toDartStrings({required int length}) {
    return <String>[for (var i = 0; i < length; ++i) this[i].toDartString()!];
  }
}

extension CharArrayString on Array<Char> {
  String toDartString(int maxLength) {
    final codeUnits = asTypedList(maxLength).takeWhile((c) => c != 0);
    return utf8.decode(codeUnits.toList());
  }
}

extension CharTypedList on Array<Char> {
  // https://github.com/dart-lang/sdk/issues/45508
  List<int> asTypedList(int length) {
    return <int>[
      for (var i = 0; i < length; ++i) this[i],
    ];
  }
}
