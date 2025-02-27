import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/cupertino.dart';

part 'search_string.g.dart';

@swidget
Widget searchString(BuildContext context) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
    color: CupertinoColors.tertiarySystemBackground,
    child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.tertiarySystemBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.tertiarySystemBackground,
          border: null,
          middle: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'My Books',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      )),
      child: Container( color: CupertinoColors.secondarySystemGroupedBackground , margin: const EdgeInsets.fromLTRB(0, 5, 0, 0), child: SafeArea(
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
      ), )
    ),
  );
}
