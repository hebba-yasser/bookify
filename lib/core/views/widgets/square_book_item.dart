import 'package:flutter/material.dart';

import '../../styles/fonts.dart';
import '../../utils/assets.dart';
import 'custom_book_image.dart';

class SquareBookItem extends StatelessWidget {
  const SquareBookItem({
    super.key,
  });

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
        SizedBox(height: 200, child: CustomBookImage(image: AppAssets.books)),
        const SizedBox(
          height: 5,
        ),
        Text(
          'book titledddddddddddddddddddddddddddddddddddddd',
          style: AppFonts.bodyText16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          // Ellipsis for overflow
        ),
      ]),
    );
  }
}
