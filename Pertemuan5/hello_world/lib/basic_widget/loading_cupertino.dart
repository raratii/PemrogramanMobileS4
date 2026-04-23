import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const LoadingCupertino());
}

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CupertinoButton(
              child: Text("Contoh button"),
              onPressed: null,
            ),
            SizedBox(height: 10),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}