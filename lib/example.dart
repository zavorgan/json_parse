import 'dart:convert';

import 'package:json_parse/book.dart';
import 'package:json_parse/example_data.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text('Кодировать'),
          ),
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
            child: const Text('Декодировать'),
          ),
        ],
      ),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;
  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(key: key, child: child);

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonExampleProvider oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {
    final objects = testData.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(objects);
    print(jsonString);
  }

  void decode() {
    try {
      final dynamic json = jsonDecode(jsonString) as List<dynamic>;
      final books = json
          .map((dynamic e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      print(books.toString());
    } catch (error) {
      print(error);
    }
  }
}
