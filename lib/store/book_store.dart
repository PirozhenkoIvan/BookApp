import 'package:flutter/material.dart';
import 'package:book_app/book/data/books_db.dart';

class BookStore {
  final bookInfo = BooksInfo();

  Future<void> insertBook(BookDb book) async {
    await bookInfo.insertBook(book);
  }

  Future<void> deleteInfoFromTableDB() async {
    bookInfo.deleteInfoFromDB();
  }

  Future<List<BookDb>> listOfBooksStore() async {
    return bookInfo.listOfBooks();
  }
}

final BookStore bookStore = BookStore();
