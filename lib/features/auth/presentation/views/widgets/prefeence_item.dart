import 'package:bookify/features/auth/presentation/views/widgets/preferences_rotated_image.dart';
import 'package:bookify/features/auth/presentation/views/widgets/preferences_ships_section.dart';
import 'package:bookify/features/auth/presentation/views/widgets/skip_button.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.onPressed,
    required this.footer,
    required this.center,
    required this.percent,
    required this.list,
    required this.selectedList,
  });
  final Function() onPressed;
  final String footer;
  final String center;
  final double percent;
  final List<String> list;
  final List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SkipButton(
          selectedList: selectedList,
          onPressed: onPressed,
        ),
        PreferencesRotatedImage(),
        Indicator(
          footer: footer,
          center: center,
          percent: percent,
        ),
        Positioned.fill(
          top: 310,
          left: 0,
          right: 0,
          child:
              PreferencesShipsSection(list: list, selectedList: selectedList),
        ),
      ],
    );
  }
}
