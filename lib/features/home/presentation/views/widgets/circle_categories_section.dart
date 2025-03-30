import 'package:flutter/material.dart';

import '../../../../../core/views/widgets/collection_title.dart';
import 'circle_category_list_view.dart';

class CircleCategoriesSection extends StatelessWidget {
  const CircleCategoriesSection({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: CollectionTitle(
            title: title,
            onPressed: () {},
          ),
        ),
        CircleCategoryListView(),
      ],
    );
  }
}
