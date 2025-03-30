import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../data/models/book_model/book_model.dart';
import '../../styles/fonts.dart';

class BookTitleAuthor extends StatelessWidget {
  const BookTitleAuthor({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          book.volumeInfo?.title ?? 'Title Not Available',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.bodyText16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'By :${book.volumeInfo!.authors?.first ?? 'No Name'}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.caption
              .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
        )
      ],
    );
  }
}
