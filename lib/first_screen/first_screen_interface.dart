import 'package:book_app/first_screen/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'search_string.dart';


class FirstScreenInterface extends StatefulWidget {
  const FirstScreenInterface({Key? key}) : super(key: key);

  @override
  State<FirstScreenInterface> createState() => _FirstScreenInterfaceState();
}

class _FirstScreenInterfaceState extends State<FirstScreenInterface> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          SearchString(),
          BooksGrid(),
        ],
      ),
    );
  }
}