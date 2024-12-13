import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_screen/first_screen_interface.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: FirstScreenInterface(),

    );
  }
}
