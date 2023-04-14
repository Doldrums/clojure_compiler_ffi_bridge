import 'dart:ffi';

import 'package:clojure_compiler_bridge/generated/bridge.pb.dart' as pb;
import 'package:clojure_compiler_bridge/utils.dart';
import 'package:ffi/ffi.dart';

import 'package:clojure_compiler_bridge/generated/clojure_compiler_bridge_bindings.dart';

import 'token.dart';

final dylib = DynamicLibrary.process();
final ClojureCompilerBridgeBindings _bindings =
    ClojureCompilerBridgeBindings(dylib);

class Compiler {
  Compiler() {
    _env = _bindings.init_enviroment();
  }

  String evalLine(String line) {
    return using((arena) {
      return _bindings.eval_line(line.toCString(arena), _env).toDartString() ??
          'Error :(';
    });
  }

  Token parseLine(String line) {
    final protobuf = using((arena) {
      final buffPtr = calloc<Pointer<UnsignedChar>>();
      final buffSize = _bindings.parse_line(buffPtr, line.toCString(arena));
      final buffList = buffPtr.cast<Uint8>().asTypedList(buffSize);
      arena.free(buffPtr);
      return buffList;
    });
    final pbToken = pb.Token.fromBuffer(protobuf);

    return Token.fromPbToken(pbToken);
  }

  late Pointer<Void> _env;
}

String evalLine(String line) {
  return using((arena) {
    final env = _bindings.init_enviroment();
    final res = _bindings.eval_line(line.toCString(arena), env);
    return res.toDartString() ?? 'Ничего не получилось';
  });
}
