import 'package:flutter/material.dart';
import 'package:book_app/book/book_item.dart';
import 'package:book_app/book/book_colors.dart';
import 'package:book_app/books_db/books_db.dart';
import 'package:book_app/main.dart';

class BooksGridWithDB extends StatefulWidget {
  @override
  State<BooksGridWithDB> createState() => BooksGrid1State();
}

class BooksGrid1State extends State<BooksGridWithDB> {
  late Future<List<BookDb>> futureBooks;
  final booksInfo = BooksInfo();

  @override
  void initState() {
    super.initState();

    booksInfo.insertBook(BookDb(
      bookName: 'Ivan Memoirs',
      percentOfReading: '100%',
      time: '17:17h',
      progress: 200,
      pageAmount: 777,
    ));

   futureBooks = booksInfo.listOfBooks();
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
        return GridView.builder(
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
            return Book(
              bookName: book.bookName,
              progress: book.progress,
              time: book.time,
              pageAmount: book.pageAmount,
              color: Colors.green,
            );
          },
        );
      },
    );
  }
}
