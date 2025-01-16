import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:book_app/book/book_item.dart';
import 'package:book_app/book/book_colors.dart';

part 'books_grid.g.dart';

@swidget
Widget booksGrid(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
    child: SingleChildScrollView(
      child: GridView.count(
        childAspectRatio: 0.7,
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [
          Book(
            bookName: "Alphabet book",
            progress: 80,
            time: "1:20",
            pageAmount: 120,
            color: green,
          ),
          Book(
            bookName: "Primer",
            progress: 120,
            time: "0:52",
            pageAmount: 300,
            color: cyan,
          ),
          Book(
            bookName: "Neznaika",
            progress: 100,
            time: "2:00",
            pageAmount: 1000,
            color: purple,
          ),
          Book(
            bookName: "Algebra 9 klass",
            progress: 0,
            time: "0:0",
            pageAmount: 320,
            color: blue,
          ),
          Book(
            bookName: "On Screen",
            progress: 63,
            time: "4:34",
            pageAmount: 76,
            color: orange,
          ),
        ],
      ),
    ),
  );
}
