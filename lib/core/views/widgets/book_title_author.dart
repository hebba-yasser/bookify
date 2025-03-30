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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              book.volumeInfo?.title ?? 'Title Not Available',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.bodyText16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By : ',
                    style: AppFonts.caption.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    book.volumeInfo!.authors?.first ?? 'No Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.caption.copyWith(
                        fontWeight: FontWeight.w500, color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
