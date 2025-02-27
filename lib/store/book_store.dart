import 'package:flutter/material.dart';
import 'package:book_app/book/data/books_db.dart';
import 'package:mobx/mobx.dart';

part 'book_store.g.dart';

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  final bookDao = BookDao();

  @observable
  ObservableList<BookDb> bookList = ObservableList<BookDb>();

  @action
  Future<void> loudBooks() async {
    final listOfBooks = await bookDao.listOfBooks();
    bookList.addAll(listOfBooks);
  }
  @action
  Future<void> insertBook(BookDb book) async {
  await bookDao.insertBook(book);
  final newBook = book;
  bookList.add(newBook);
  }

  Future<void> deleteInfoFromTableDB() async {
    bookDao.deleteInfoFromDB();
  }

}

final BookStore bookStore = BookStore();
