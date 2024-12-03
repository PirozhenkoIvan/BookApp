import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/cupertino.dart';

part 'top_ios_interface.g.dart';

@swidget
Widget topInterface(BuildContext context) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'My Books',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      )),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                placeholder: 'Search',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
