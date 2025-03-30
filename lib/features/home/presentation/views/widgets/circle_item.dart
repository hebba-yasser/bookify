import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({
    super.key,
    required this.title,
    required this.imagePath,
  });
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: AppFonts.bodyText18.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
