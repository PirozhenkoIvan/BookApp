// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookStore on _BookStore, Store {
  late final _$bookListAtom =
      Atom(name: '_BookStore.bookList', context: context);

  @override
  ObservableList<BookDb> get bookList {
    _$bookListAtom.reportRead();
    return super.bookList;
  }

  @override
  set bookList(ObservableList<BookDb> value) {
    _$bookListAtom.reportWrite(value, super.bookList, () {
      super.bookList = value;
    });
  }

  late final _$listOfBooksStoreAsyncAction =
      AsyncAction('_BookStore.listOfBooksStore', context: context);

  @override
  Future<void> listOfBooksStore() {
    return _$listOfBooksStoreAsyncAction.run(() => super.listOfBooksStore());
  }

  @override
  String toString() {
    return '''
bookList: ${bookList}
    ''';
  }
}
