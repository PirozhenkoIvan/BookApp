import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookDb {
  final String bookName;
  final String percentOfReading;
  final String time;
  final double progress;
  final double pageAmount;

  BookDb({
    required this.bookName,
    required this.percentOfReading,
    required this.time,
    required this.progress,
    required this.pageAmount,
  });

  Map<String, Object?> toMap() {
    return {
      'bookName': bookName,
      'percentOfReading': percentOfReading,
      'time': time,
      'progress': progress,
      'pageAmount': pageAmount,
    };
  }

  @override
  String toString() {
    return 'Book {bookName: $bookName, percentOfReading: $percentOfReading, time: $time, progress: $progress, pageAmount: $pageAmount}';
  }
}

class BooksInfo {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'books_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE books(bookName TEXT PRIMARY KEY, percentOfReading TEXT, time TEXT, progress INTEGER, pageAmount INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertBook(BookDb book) async {
    final db = await database;
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BookDb>> listOfBooks() async {
    final db = await database;
    final List<Map<String, Object?>> maps = await db.query('books');

    return maps.map((book) {
      return BookDb(
        bookName: book['bookName'] as String,
        percentOfReading: book['percentOfReading'] as String,
        time: book['time'] as String,
        progress: (book['progress'] as num).toDouble(),
        pageAmount: (book['pageAmount'] as num).toDouble(),
      );
    }).toList();
  }
}
