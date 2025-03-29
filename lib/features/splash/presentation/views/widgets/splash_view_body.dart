import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              AppAssets.logo,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'BOOKIFY',
          style: AppFonts.accentHeading,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
