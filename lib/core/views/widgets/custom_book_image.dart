import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(image)?.hasAbsolutePath ?? false;

    return AspectRatio(
      aspectRatio: 2.4 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: isValidUrl
            ? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image,
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Icon(Icons.error),
      ),
    );
  }
}
