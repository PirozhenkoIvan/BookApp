import 'package:flutter/material.dart';
import 'package:book_app/book/book_item.dart';
import 'package:book_app/book/book_colors.dart';
import 'package:book_app/books_db/books_db.dart';
import 'package:book_app/main.dart';

class BooksGridWithDB extends StatefulWidget {
  @override
  State<BooksGridWithDB> createState() => BooksGridWithDBState();
}

class BooksGridWithDBState extends State<BooksGridWithDB> {
  late Future<List<BookDb>> futureBooks;
  final booksInfo = BooksInfo();

  @override
  void initState() {
    super.initState();

    // booksInfo.deleteInfoFromDB();

    booksInfo.insertBook(
      BookDb(
        bookName: 'Ivan Memoirs',
        time: '99:99',
        progress: 200,
        pageAmount: 777,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Oxford Practice Grammar',
        time: '9:00',
        progress: 80,
        pageAmount: 170,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Don Quixote',
        time: '1:15',
        progress: 30,
        pageAmount: 1215,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Alice`s Adventures in Wonderland',
        time: '70:00',
        progress: 700,
        pageAmount: 1000,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'The Adventures of Huckleberry Finn',
        time: '0:25',
        progress: 8,
        pageAmount: 560,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'The Adventures of Tom Sawyer',
        time: '4:20',
        progress: 100,
        pageAmount: 600,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Treasure Island',
        time: '7:30',
        progress: 180,
        pageAmount: 934,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Moby Dick',
        time: '22:14',
        progress: 356,
        pageAmount: 932,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Pride and Prejudice ',
        time: '20:10',
        progress: 700,
        pageAmount: 1420,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Wuthering Heights',
        time: '30:54',
        progress: 900,
        pageAmount: 900,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: '	The Scarlet Letter',
        time: '1:12',
        progress: 30,
        pageAmount: 230,
      ),
    );
    booksInfo.insertBook(
      BookDb(
        bookName: 'Jane Eyre',
        time: '0:00',
        progress: 0,
        pageAmount: 450,
      ),
    );

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
        return Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              height: 600,
              child: GridView.builder(
                shrinkWrap: false,
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
