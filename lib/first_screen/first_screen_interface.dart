import 'package:book_app/first_screen/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'search_string.dart';

part 'first_screen_interface.g.dart';

@swidget
  Widget firstScreenInterface(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          SearchString(),
          BooksGrid(),
        ],
      ),
    );
  }
