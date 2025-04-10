import 'package:bookify/core/views/widgets/book_title_author.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/views/widgets/custom_book_image.dart';

class BookDetailsItem extends StatelessWidget {
  const BookDetailsItem({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      width: 160, // Fixed card width
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBookImage(
            image: book.volumeInfo?.imageLinks?.thumbnail ?? ' ',
          ),
          const SizedBox(
            height: 6,
          ),
          BookTitleAuthor(
            book: book,
          ),
        ],
      ),
    );
  }
}
