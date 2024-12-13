import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

part 'book_item.g.dart';

@swidget
Widget book(BuildContext context, { required Color color, required String bookName , required double progress , required String time, required double pageAmount}){
return Container(
  height: 178,
  width: 124,
  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(9),
      bottomLeft: Radius.circular(4),
      bottomRight: Radius.circular(9),
    ),
  ),
  child: Stack(
    children: [
      Container(
        width: 100,
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 50),
        alignment: Alignment.center,
        child: AutoSizeText(bookName,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
        minFontSize: 10,),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 3, 0, 0),
        alignment: Alignment.topLeft,
        child: Text('$progress',
          style: TextStyle(
            color: Colors.black45,
            fontFamily: 'Montserrat',
            fontSize: 14,
          ),),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 3, 10, 0),
        alignment: Alignment.topRight,
        child: Text("${time}h",
          style: TextStyle(
            color: Colors.black45,
            fontFamily: 'Montserrat',
            fontSize: 14,
          ),),
      ),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 140, 0, 0),
        child: ProgressBar(value: progress, minValue: 0, maxValue: pageAmount) ,
      )
    ],
  ),
);
}