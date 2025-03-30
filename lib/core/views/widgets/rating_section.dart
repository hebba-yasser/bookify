import 'package:bookify/core/views/widgets/star_rating_genrator.dart';
import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarRating(rating: rating),
        Text(
          '($rating)',
          style: AppFonts.bodyText16,
        ),
      ],
    );
  }
}
