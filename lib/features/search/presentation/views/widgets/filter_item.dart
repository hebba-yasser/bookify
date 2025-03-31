import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import 'choice_chip_item.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.optionsList,
    required this.title,
  });
  final List<String> optionsList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppFonts.heading22.copyWith(fontWeight: FontWeight.bold)),
        ChoiceChipItem(
          optionsList: optionsList,
        ),
      ],
    );
  }
}
