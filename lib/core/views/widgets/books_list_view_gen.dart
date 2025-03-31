import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../book_details_view.dart';
import 'book_list_view_item.dart';

class BooksListViewGen extends StatelessWidget {
  const BooksListViewGen({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    BookDetailsView(
                      book: books[index],
                    ));
              },
              child: BookListViewItem(
                book: books[index],
              )),
        ),
      ),
    );
  }
}
