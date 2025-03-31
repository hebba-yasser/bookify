import 'package:bookify/core/views/widgets/rating_section.dart';
import 'package:bookify/core/views/widgets/similar_books_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_info_section.dart';
import 'book_title_author.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            BookTitleAuthor(
              book: bookModel,
            ),
            RatingSection(
                rating: bookModel.volumeInfo?.averageRating?.toDouble() ?? 0.0),
            BookInfoSection(
              bookModel: bookModel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: kPrimaryColor,
                thickness: 2,
              ),
            ),
            SimilarBooksBlocBuilder(
              currentBook: bookModel,
            ),
          ],
        ),
      ),
    );
  }
}
