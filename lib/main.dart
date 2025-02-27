import 'package:book_app/first_screen/book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_app/book/book_add_screen/book_add_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookScreen(),
      initialRoute: '/',
      routes: {
        '/AddBookScreen': (context) => const AddBook(),
      },
    );
  }
}
