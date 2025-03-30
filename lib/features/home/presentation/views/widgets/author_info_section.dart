import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/models/author_model/author_model.dart';

class AuthorInfoSection extends StatelessWidget {
  const AuthorInfoSection({
    super.key,
    required this.author,
  });
  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: author.authorImagePath != null
                ? CachedNetworkImageProvider(author.authorImagePath!)
                : AssetImage(AppAssets.noImage) as ImageProvider,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            author.authorName,
            style: AppFonts.heading22,
          ),
        ],
      ),
    );
  }
}
