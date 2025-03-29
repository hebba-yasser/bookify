import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';

class AuthTextSection extends StatelessWidget {
  const AuthTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Start Your Reading Adventure!',
          style: AppFonts.accentHeading.copyWith(color: kPrimaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Access all your favorite books in one place. Enjoy reading wherever you are at home, on the go, or while traveling!',
          style: AppFonts.accentBody18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
