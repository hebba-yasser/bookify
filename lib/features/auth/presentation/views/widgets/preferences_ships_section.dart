import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class PreferencesShipsSection extends StatelessWidget {
  const PreferencesShipsSection({
    super.key,
    required this.list,
    required this.selectedList,
  });

  final List<String> list;
  final List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: list.map((label) {
                  return FilterChip(
                    label: Text(
                      label,
                    ),
                    disabledColor: Colors.white,
                    selected: selectedList.contains(label),
                    selectedColor: kPrimaryColor,
                    labelStyle: AppFonts.bodyText16,
                    shadowColor: Colors.white,
                    selectedShadowColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    backgroundColor: AppColors.lightGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    showCheckmark: false,
                    side:
                        const BorderSide(width: 2, color: AppColors.lightGrey),
                    onSelected: (value) {
                      // onSelectedFunction(selectedList, label);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
