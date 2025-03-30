import 'package:bookify/core/views/widgets/books_view_body.dart';
import 'package:flutter/material.dart';

import '../data/models/book_model/book_model.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key, required this.title, required this.books})
      : super(key: key);
  final String title;
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BooksViewBody(
        books: books,
        title: title,
      )),
    );
  }
}
