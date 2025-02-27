import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';
import 'books_grid.dart';

part 'book_screen.g.dart';

@swidget
Widget bookScreen(BuildContext context) {
  return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:   SuperScaffold(
          appBar: SuperAppBar(
              largeTitle: SuperLargeTitle(
                enabled: true,
                largeTitle: "My Books",
                actions: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.add, size: 28 , ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/AddBookScreen');
                    },
                  ),
                ],
              ),
              searchBar: SuperSearchBar(
                enabled: true,
              )
          ),
          body: BooksGrid() ,
        )
    );

}

