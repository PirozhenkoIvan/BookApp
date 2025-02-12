import 'package:flutter/material.dart';
import 'package:book_app/book/data/books_db.dart';
import 'package:mobx/mobx.dart';

part 'book_store.g.dart';

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  final bookInfo = BooksInfo();

  @observable
  ObservableList<BookDb> bookList = ObservableList<BookDb>();

  @action
  Future<void> listOfBooksStore() async {
    final listOfBooks = await bookInfo.listOfBooks();
    bookList.addAll(listOfBooks);
    print(bookList);
  }

  Future<void> insertBook(BookDb book) async {
    await bookInfo.insertBook(book);
  }

  Future<void> deleteInfoFromTableDB() async {
    bookInfo.deleteInfoFromDB();
  }
}

final BookStore bookStore = BookStore();
