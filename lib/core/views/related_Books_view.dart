import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/views/widgets/related_books_view_body.dart';
import 'package:flutter/material.dart';

class RelatedBooksView extends StatelessWidget {
  const RelatedBooksView({
    super.key,
    required this.bookTitle,
    required this.similarBooks,
  });
  final String bookTitle;
  final List<BookModel> similarBooks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RelatedBooksViewBody(
        similarBooks: similarBooks,
        bookTitle: bookTitle,
      )),
    );
  }
}
