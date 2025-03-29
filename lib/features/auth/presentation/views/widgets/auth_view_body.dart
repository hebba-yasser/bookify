import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'auth_buttons_section.dart';
import 'auth_text_section.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.authImg,
          height: MediaQuery.sizeOf(context).height * .4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AuthTextSection(),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AuthButtonsSection(),
        ),
      ],
    );
  }
}
