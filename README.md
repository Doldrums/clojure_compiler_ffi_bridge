# [clojure_compiler_ffi_bridge](https://github.com/Doldrums/clojure_compiler_ffi_bridge): High-level memory-safe FFI bridge for Flutter/Dart <-> hand-written Clojure compiler

[![Flutter Package](https://img.shields.io/pub/v/clojure_compiler_ffi_bridge.svg)](https://pub.dev/packages/clojure_compiler_ffi_bridge)
[![Stars](https://img.shields.io/github/stars/Doldrums/clojure_compiler_ffi_bridge)](https://github.com/Doldrums/clojure_compiler_ffi_bridge)

![Logo](https://github.com/Doldrums/clojure_compiler_ffi_bridge/blob/main/header.png)

Want to combine the best between [Flutter](https://flutter.dev/), a cross-platform hot-reload rapid-development UI toolkit, and [Clojure](https://clojure.org/), a dynamic, general-purpose programming language, combining the approachability and interactive development of a scripting language with an efficient and robust infrastructure for multithreaded programming to build reliable and efficient software? Here it comes!

## 🚀 Advantages

* **Memory-safe**: Never need to think about malloc/free.
* **Cross-platform**: Android, iOS, Windows, Linux, MacOS, and Web. (almost supported)
* **Fast**: It is only a thin (though feature-rich) wrapper.
* **Pure-Dart compatible:** This package is 100% compatible with Dart.

## 💡 Usage
![Example](https://github.com/Doldrums/clojure_compiler_ffi_bridge/blob/main/example.gif)
### Installation 

```yaml
dependencies:
  clojure_compiler_ffi_bridge: ^0.0.1
```
### Configure and execute
```dart
import 'package:clojure_compiler_bridge/clojure_compiler_bridge.dart';
/// create instance of Clojure Compiler
final engine = Compiler();
/// execute Clojure source code line by line
callResult = engine.evalLine('<<some clojure code>>>');
JsonEncoder encoder = const JsonEncoder.withIndent('  ');
/// parse Clojure source code line by line to AST
evalResult = encoder.convert(engine.parseLine(_formController.text));
```

