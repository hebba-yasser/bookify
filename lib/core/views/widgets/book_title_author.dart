import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class BookTitleAuthor extends StatelessWidget {
  const BookTitleAuthor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
                ' titlccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccce',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.heading20),
            Text(
              'author Namecccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc      ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.caption.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
