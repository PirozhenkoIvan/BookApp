import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'progress_bar.dart';

part 'books_middle.g.dart';

@swidget
Widget books(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 170,
            width: 125,
            margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  alignment: Alignment.center,
                  child: Text('Cujo',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text('70%',
                  style: TextStyle(
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                  ),),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 10, 0),
                  alignment: Alignment.topRight,
                  child: Text('1:20h',
                    style: TextStyle(
                      color: Colors.black45,
                      fontStyle: FontStyle.italic,
                    ),),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: ProgressBar(value: 80, minValue: 0, maxValue: 120) ,
                )

              ],
            ),
          )
        ],
      )
    ],
  );
}
