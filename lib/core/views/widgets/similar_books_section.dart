import 'package:bookify/core/views/widgets/square_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import 'collection_title.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
    required this.books,
  });
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionTitle(
          title: 'similar Books',
          onPressed: () {},
        ),
        SquareBooksListView(
          books: books,
        ),
      ],
    );
  }
}
