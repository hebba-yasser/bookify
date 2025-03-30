import 'package:bookify/features/home/data/models/author_model/author_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({
    super.key,
    required this.author,
  });
  final AuthorModel author;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: author.authorImagePath != null
              ? CachedNetworkImageProvider(
                  author.authorImagePath!,
                  errorListener: (p0) => Icon(Icons.error),
                )
              : AssetImage(AppAssets.noImage) as ImageProvider,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          author.authorName,
          style: AppFonts.bodyText18.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
