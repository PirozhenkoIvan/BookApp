// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class Book extends StatelessWidget {
  const Book({
    Key? key,
    required this.color,
    required this.bookName,
    required this.progress,
    required this.time,
    required this.pageAmount,
  }) : super(key: key);

  final Color color;

  final String bookName;

  final double progress;

  final String time;

  final double pageAmount;

  @override
  Widget build(BuildContext _context) => book(
        _context,
        color: color,
        bookName: bookName,
        progress: progress,
        time: time,
        pageAmount: pageAmount,
      );
}
