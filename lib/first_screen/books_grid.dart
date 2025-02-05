import 'package:flutter/material.dart';
import 'package:book_app/book/ui/book_item.dart';
import 'package:book_app/book/ui/book_colors.dart';
import 'package:book_app/book/data/books_db.dart';
import 'package:book_app/store/book_store.dart';

class BooksGrid extends StatefulWidget {
  @override
  State<BooksGrid> createState() => BooksGridState();
}

class BooksGridState extends State<BooksGrid> {
  late Future<List<BookDb>> futureBooks;

  @override
  void initState() {
    super.initState();
    bookStore.insertBook(
      BookDb(
        bookName: 'Ivan Memoirs',
        time: '99:99',
        progress: 200,
        pageAmount: 777,
      ),
    );
    futureBooks = bookStore.listOfBooksStore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookDb>>(
      future: futureBooks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final books = snapshot.data ?? [];
        return Padding(
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
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
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
            ));
      },
    );
  }
}
