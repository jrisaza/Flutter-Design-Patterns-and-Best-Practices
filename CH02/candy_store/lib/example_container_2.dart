import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.tight(
            const Size(200, 100),
          ),
          color: Colors.red,
          child: const Text('Hello World'),
        ),
      ),
    ),
  );
}
