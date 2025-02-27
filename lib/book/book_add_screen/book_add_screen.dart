import 'package:book_app/book/data/books_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

import 'package:book_app/store/book_store.dart';

part 'book_add_screen.g.dart';

@hwidget
Widget addBook(BuildContext context) {
  final _formKey = useMemoized(() => GlobalKey<FormState>());
  final bookName = useState(" ");
  final amountOfPage = useState(0.0);
  final bookColor = useState<Color>(Colors.red);

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 370,
              child: HueRingPicker(
                pickerColor: bookColor.value,
                onColorChanged: (Color color) {
                  bookColor.value = color;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Scaffold(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    body: SuperScaffold(
        appBar: SuperAppBar(
            previousPageTitle: 'Back',
            largeTitle: SuperLargeTitle(
              enabled: false,
              largeTitle: 'Add Book',
              textStyle: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
            searchBar: SuperSearchBar(
              enabled: false,
            )),
        body: Form(
            key: _formKey,
            child: Column(children: [
              CupertinoFormSection.insetGrouped(
                  header: Text(
                    'Book name',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border(),
                  ),
                  children: [
                    Container(
                      height: 47,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: CupertinoTextFormFieldRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CupertinoColors.white,
                        ),
                        placeholder: "Title",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        onChanged: (name) {
                          bookName.value = name;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            _formKey.currentState!.reset();
                          }
                        },
                      ),
                    )
                  ]),
              CupertinoFormSection.insetGrouped(
                  header: Text(
                    'Amount of pages',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border(),
                  ),
                  children: [
                    Container(
                      height: 47,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: CupertinoTextFormFieldRow(
                        placeholder: "Amount of pages",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        onChanged: (amount) {
                          amountOfPage.value = double.parse(amount);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (String? value) {
                          if (value == 0 || value!.isEmpty) {
                            _formKey.currentState!.reset();
                          }
                        },
                      ),
                    )
                  ]),
              CupertinoFormSection.insetGrouped(
                  header: Text(
                    'Amount of pages',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    border: Border(),
                  ),
                  children: [
                    Container(
                      height: 47,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            decoration: BoxDecoration(
                                color: bookColor.value,
                                borderRadius: BorderRadius.circular(16)),
                            child: MaterialButton(onPressed: () {
                              pickColor(context);
                            }),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Color #${colorToHex(bookColor.value)}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                ),
                              )),
                        ],
                      ),
                    )
                  ]),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: CupertinoButton.filled(
                            child: const Text("Add"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                bookStore.insertBook(BookDb(
                                    bookName: bookName.value,
                                    time: "00:00",
                                    color: '0x${colorToHex(bookColor.value)}',
                                    progress: 0,
                                    pageAmount: amountOfPage.value));
                              }
                            })),
                  )
                ],
              ),
            ]))),
  );
}
