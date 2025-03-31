import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../../styles/fonts.dart';
import 'books_grid_view.dart';
import 'custom_back_button.dart';

class RelatedBooksViewBody extends StatelessWidget {
  const RelatedBooksViewBody(
      {super.key, required this.bookTitle, required this.similarBooks});

  final String bookTitle;
  final List<BookModel> similarBooks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 12),
          leading: const CustomBackButton(),
          title: Text(
            'Related to',
            style: AppFonts.bodyText16.copyWith(color: Colors.black54),
          ),
          subtitle: Text(
            bookTitle,
            style: AppFonts.bodyText18,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: BooksGridView(
              books: similarBooks,
            ),
          ),
        )
      ],
    );
  }
}
