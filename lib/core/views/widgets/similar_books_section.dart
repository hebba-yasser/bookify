import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/core/views/related_Books_view.dart';
import 'package:bookify/core/views/widgets/square_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import 'collection_title.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
    required this.books,
    required this.currentBook,
  });
  final BookModel currentBook;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionTitle(
          title: 'similar Books',
          onPressed: () {
            navigatorPush(
                context,
                RelatedBooksView(
                    bookTitle:
                        currentBook.volumeInfo?.title ?? 'no title available',
                    similarBooks: books));
          },
        ),
        SquareBooksListView(
          books: books,
        ),
      ],
    );
  }
}
