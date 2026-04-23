import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Ratih Purnama Dewi ',
      home: Scaffold(
        appBar: AppBar(title: const Text('244107060055 - Ratih Purnama Dewi ')),
        body: const Center(child: Text('Hello, Ratih!')),
      ),
    );
  }
}
