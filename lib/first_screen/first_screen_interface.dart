import 'package:book_app/first_screen/books_middle.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'top_ios_interface.dart';

part 'first_screen_interface.g.dart';

@swidget
Widget firstScreenInterface(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        TopInterface(),
        Books(),

      ],
    ),
  );
}
