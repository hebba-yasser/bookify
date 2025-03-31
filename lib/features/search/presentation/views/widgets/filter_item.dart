import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/fonts.dart';
import '../../manager/filter_cubit/filter_cubit.dart';
import '../../manager/filter_cubit/filter_states.dart';
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
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        String? selectedValue;
        if (title == "Order By") {
          selectedValue = cubit.selectedOrderBy;
        } else if (title == "Filter Book Type") {
          selectedValue = cubit.selectedBookType;
        } else if (title == "Language") {
          selectedValue = cubit.selectedLanguage;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    AppFonts.heading22.copyWith(fontWeight: FontWeight.bold)),
            ChoiceChipItem(
              optionsList: optionsList,
              selectedValue: selectedValue,
              onSelected: (value) {
                if (title == "Order By") {
                  cubit.selectOrderBy(value);
                } else if (title == "Filter Book Type") {
                  cubit.selectBookType(value);
                } else if (title == "Language") {
                  cubit.selectLanguage(value);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
