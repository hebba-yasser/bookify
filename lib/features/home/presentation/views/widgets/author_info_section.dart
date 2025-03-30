import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';

class AuthorInfoSection extends StatelessWidget {
  const AuthorInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppAssets.noImage),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'auth name',
            style: AppFonts.heading22,
          ),
        ],
      ),
    );
  }
}
