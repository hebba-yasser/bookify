import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import '../../manager/fetch_search_cubit_cubit/fetch_search_states.dart';
import '../../manager/filter_cubit/filter_cubit.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchSearchBookCubit, FetchSearchBookStates>(
      listener: (context, state) {
        if (state is FetchSearchSuccess) {
          Navigator.pop(context);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Reset',
                    textStyle: AppFonts.heading20,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightGrey,
                      foregroundColor: AppColors.lightTeal,
                    ),
                    onPressed: () =>
                        context.read<FilterCubit>().clearAllFilters(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: 'Filter',
                    onPressed: () {
                      final filterCubit = context.read<FilterCubit>();
                      final searchCubit = context.read<FetchSearchBookCubit>();

                      searchCubit.fetchSearchBook(
                        query:
                            searchCubit.currentQuery, // Keep the existing query
                        language: filterCubit.selectedLanguageCode,
                        orderBy: filterCubit.selectedOrderBy,
                        filter: filterCubit.selectedBookType,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
