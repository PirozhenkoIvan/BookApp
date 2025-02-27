import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:book_app/book/book_add_screen/book_add_screen.dart';


String colorHex = 'FFF6F706';
String colorId = '0x${colorHex}';
Color test = Color(int.parse(colorId));

Color pickerColor = Color(0xff443a49);

Color green0 = const Color(0xFFD5EF9F);
Color green1 = const Color(0xFFA7C763);
Color green2 = const Color(0xFF819E34);
Color green3 = const Color(0xFF365000);

Color yellow0 = const Color(0xFFFFFEAA);
Color yellow1 = const Color(0xFFD4D46A);
Color yellow2 = const Color(0xFF807F15);

Color purple = const Color(0xffe5a3ff);
Color orange = const Color(0xfffcba8d);
Color blue = const Color(0xff99bdff);
Color cyan = const Color(0xff9ee6d7);

List<Color> appColors = [
  green0 , green1, green2 ,
  //yellow0 , yellow1 , yellow2
];
