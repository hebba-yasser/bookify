import 'package:bookify/constants.dart';
import 'package:bookify/core/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/views/widgets/books_grid_view.dart';
import '../../../data/models/author_model/author_model.dart';
import 'author_info_section.dart';

class AuthorBooksViewBody extends StatelessWidget {
  const AuthorBooksViewBody(
      {Key? key, required this.author, required this.books})
      : super(key: key);
  final AuthorModel author;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Author Details'),
          AuthorInfoSection(
            author: author,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10),
            child: Text(
              'Author\'s Books',
              style: AppFonts.heading20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 3,
            color: kPrimaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: BooksGridView(
                books: books,
              ),
            ),
          )
        ],
      ),
    );
  }
}
