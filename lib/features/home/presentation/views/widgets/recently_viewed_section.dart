import 'package:flutter/material.dart';

import '../../../../../core/views/widgets/collection_title.dart';
import 'books_cover_list_view.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
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
            title: 'Recently viewed',
            onPressed: () {},
          ),
        ),
        BooksCoverListView(),
      ],
    );
  }
}
