import 'package:bookify/core/views/widgets/rating_section.dart';
import 'package:bookify/core/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'book_info_section.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          // BookTitleAuthor(),
          RatingSection(),
          BookInfoSection(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              color: kPrimaryColor,
              thickness: 2,
            ),
          ),
          SimilarBooksSection(),
        ],
      ),
    );
  }
}
