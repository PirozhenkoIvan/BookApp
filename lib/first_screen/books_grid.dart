import 'package:flutter/material.dart';
import 'package:book_app/book/ui/book_item.dart';
import 'package:book_app/book/ui/book_colors.dart';
import 'package:book_app/book/data/books_db.dart';
import 'package:book_app/store/book_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

// class BooksGrid extends StatefulWidget {
//   @override
//   State<BooksGrid> createState() => BooksGridState();
// }
//
// class BooksGridState extends State<BooksGrid> {
//   @override
//   void initState() {
//     super.initState();
//     bookStore.listOfBooksStore();
//   }
//
//   @override

part 'books_grid.g.dart';

@hwidget
Widget booksGrid(BuildContext context) {
  final bookList = useState(bookStore.bookList);

  useEffect(() {
    if(bookStore.bookList.isEmpty){
      bookStore.listOfBooksStore();
    }
  });

  return Observer(
      builder: (_) => Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              height: 600,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7,
                ),
                itemCount: bookList.value.length,
                itemBuilder: (context, index) {
                  final book = bookList.value[index];
                  final color = appColors[index % appColors.length];
                  return Book(
                    bookName: book.bookName,
                    progress: book.progress,
                    time: book.time,
                    pageAmount: book.pageAmount,
                    color: color,
                  );
                },
              ),
            ),
          ));
}
