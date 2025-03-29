import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../../auth/presentation/views/auth_view.dart';
import '../../../data/models/onboarding_model.dart';
import 'onbording_text_item.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});
  final OnboardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              navigatorPushAndRemove(context, const AuthView());
            },
            child: Text(
              'Skip',
              style: AppFonts.accentBody22
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            model.imagePath,
            fit: BoxFit.contain,
            height: MediaQuery.sizeOf(context).height * .40,
          ),
        ),
        onboardingTextItem(model: model),
      ],
    );
  }
}
