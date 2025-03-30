import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../../styles/fonts.dart';
import 'custom_book_image.dart';

class SquareBookItem extends StatelessWidget {
  const SquareBookItem({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 200,
            child: CustomBookImage(
                image: book.volumeInfo?.imageLinks?.thumbnail ?? ' ')),
        const SizedBox(
          height: 5,
        ),
        Text(
          book.volumeInfo?.title ?? 'No Title Available',
          style: AppFonts.bodyText16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          // Ellipsis for overflow
        ),
      ]),
    );
  }
}
