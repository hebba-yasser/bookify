import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import 'circle_category_list_view.dart';

class CircleCategoriesSection extends StatelessWidget {
  const CircleCategoriesSection({
    super.key,
    required this.collectionTitle,
  });
  final String collectionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            collectionTitle,
            style: AppFonts.heading20,
          ),
        ),
        CircleCategoryListView(),
      ],
    );
  }
}
