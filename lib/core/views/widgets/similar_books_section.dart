import 'package:bookify/core/views/widgets/square_books_list_view.dart';
import 'package:flutter/material.dart';

import 'collection_title.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionTitle(
          title: 'similar Books',
          onPressed: () {},
        ),
        SquareBooksListView(),
      ],
    );
  }
}
