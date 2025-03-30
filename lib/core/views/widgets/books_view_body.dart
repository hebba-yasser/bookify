import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import 'books_list_view_gen.dart';
import 'custom_app_bar.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({Key? key, required this.title, required this.books})
      : super(key: key);
  final String title;
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(title: title),
          BooksListViewGen(
            books: books,
          ),
        ],
      ),
    );
  }
}
