import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(image, fit: BoxFit.fill),
// CachedNetworkImage(
// fit: BoxFit.fill,
// imageUrl: image,
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),
      ),
    );
  }
}
