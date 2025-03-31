import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';

class ChoiceChipItem extends StatelessWidget {
  const ChoiceChipItem({
    required this.optionsList,
    required this.onSelected,
    required this.selectedValue,
    super.key,
  });

  final List<String> optionsList;
  final Function(String) onSelected;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: optionsList.map((option) {
        final bool isSelected = selectedValue == option;
        return ChoiceChip(
          label: Text(option,
              style:
                  TextStyle(color: isSelected ? Colors.white : Colors.black)),
          selected: isSelected,
          selectedColor: kPrimaryColor,
          backgroundColor: AppColors.lightGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          showCheckmark: false,
          side: const BorderSide(width: 2, color: AppColors.lightGrey),
          onSelected: (_) => onSelected(option),
        );
      }).toList(),
    );
  }
}
