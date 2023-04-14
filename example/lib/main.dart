import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:clojure_compiler_bridge/clojure_compiler_bridge.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController _formController;
  late final EmojiParser _emojiLib;
  String callResult = '';
  String evalResult = '';
  bool callResultRecieved = false;
  late final Compiler engine;

  @override
  void initState() {
    super.initState();
    _emojiLib = EmojiParser();
    _formController = TextEditingController(
        text:
            '((def! fib (fn* (N) (if (= N 0) 1 (if (= N 1) 1 (+ (fib (- N 1)) (fib (- N 2))))))) 10)');
    engine = Compiler();
  }

  void _execute() {
    setState(() {
      callResult = engine.evalLine(_formController.text);
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      evalResult = encoder.convert(engine.parseLine(_formController.text));
      callResultRecieved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clojure Compiler FFI Bridge Example'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clojure inspired Lisp interpreter. Consists of C++ lang interpreter part, FFI bridge via Protobuf and Flutter wrapper.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Consider example',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                spacerSmall,
                TextFormField(
                  maxLines: 5,
                  controller: _formController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    labelText: 'Clojure source code',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                callResultRecieved
                    ? RichText(
                        text: TextSpan(
                          text:
                              '${_emojiLib.get('fire').code}Execution result: ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: callResult,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                spacerSmall,
                callResultRecieved
                    ? Text(
                        '${_emojiLib.get('coffee').code}Tokens: Abstract Syntax Tree for the provided source code is presented below:',
                        style: textStyle.copyWith(fontSize: 15),
                        textAlign: TextAlign.start,
                      )
                    : const SizedBox.shrink(),
                callResultRecieved
                    ? Text(
                        'evalResult = $evalResult',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.start,
                      )
                    : const SizedBox.shrink(),
                spacerSmall,
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _execute.call(),
          icon: const Icon(Icons.play_circle_outline_rounded),
          label: const Text('Execute'),
        ),
      ),
    );
  }
}
