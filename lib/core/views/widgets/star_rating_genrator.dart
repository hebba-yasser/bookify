import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating; // Expected range: 0-5
  final double starSize;
  final Color filledColor;
  final Color unfilledColor;

  const StarRating({
    super.key,
    required this.rating,
    this.starSize = 30.0,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double fillAmount = 0;
        if (rating >= index + 1) {
          fillAmount = 1;
        } else if (rating > index) {
          fillAmount = rating - index;
        }

        return Stack(
          children: [
            Icon(
              Icons.star_rounded,
              size: starSize,
              color: unfilledColor,
            ),
            ClipRect(
              clipper: _StarClipper(fillAmount),
              child: Icon(
                Icons.star,
                size: starSize,
                color: filledColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillAmount;

  _StarClipper(this.fillAmount);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0,
      0,
      size.width * fillAmount,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
