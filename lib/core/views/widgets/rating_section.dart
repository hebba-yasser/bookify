import 'package:bookify/core/views/widgets/star_rating_genrator.dart';
import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarRating(rating: 10),
        Text(
          '(3.5)',
          style: AppFonts.bodyText16,
        ),
      ],
    );
  }
}
