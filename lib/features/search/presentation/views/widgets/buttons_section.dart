import 'package:flutter/material.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  textStyle: AppFonts.heading20,
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGrey,
                    foregroundColor: AppColors.lightTeal,
                  ),
                  text: 'reset',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  text: 'Filter',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
