import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../utils/assets.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10)),
        height: 170,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.2 / 3,
                child: CustomBookImage(image: AppAssets.books)),
            const SizedBox(
              width: 10,
            ),
            // Expanded(
            //   child: BookTitleAuthor(),
            // ),
          ],
        ),
      ),
    );
  }
}
