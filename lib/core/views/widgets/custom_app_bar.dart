import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/fonts.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const CustomBackButton(),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: AppFonts.heading22.copyWith(color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
          ),
        ],
      ),
    );
  }
}
