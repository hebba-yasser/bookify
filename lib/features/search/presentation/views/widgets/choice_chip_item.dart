import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class ChoiceChipItem extends StatelessWidget {
  ChoiceChipItem({
    required this.optionsList,
    super.key,
    this.selectedIndex,
  });
  final List<String> optionsList;

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(optionsList.length, (index) {
        final bool isSelected = selectedIndex == index;
        return ChoiceChip(
          label: Text(
            optionsList[index],
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black), // White text when selected
          ),
          selected: isSelected,
          disabledColor: Colors.white,
          selectedColor: kPrimaryColor,
          labelStyle: AppFonts.bodyText16,
          shadowColor: Colors.white,
          selectedShadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          backgroundColor: AppColors.lightGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          showCheckmark: false,
          side: const BorderSide(width: 2, color: AppColors.lightGrey),
          onSelected: (bool selected) {
            // setState(() {
            //   selectedIndex = selected ? index : null;
            // });
          },
        );
      }),
    );
  }
}
