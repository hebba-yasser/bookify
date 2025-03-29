import 'package:bookify/features/auth/presentation/views/widgets/text_button_sign_in.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/views/widgets/custom_button.dart';
import '../sign_up_view.dart';

class AuthButtonsSection extends StatelessWidget {
  const AuthButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Let\'s Get Started',
          onPressed: () {
            navigatorPush(context, const SignUpView());
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextButtonSIgnIn(),
      ],
    );
  }
}
