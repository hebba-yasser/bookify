import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:flutter/material.dart';

import '../../../../../core/views/books_view.dart';
import '../../../../../core/views/widgets/collection_title.dart';
import 'books_list_view.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({
    super.key,
    required this.collectionTitle,
  });
  final String collectionTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: CollectionTitle(
            title: collectionTitle,
            onPressed: () {
              navigatorPush(
                  context,
                  BooksView(
                    title: collectionTitle,
                  ));
            },
          ),
        ),
        BooksListView(),
      ],
    );
  }
}
