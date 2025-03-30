import 'package:bookify/features/auth/presentation/manager/Preference_Cubit/sign_up_preference%20_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencesShipsSection extends StatelessWidget {
  const PreferencesShipsSection({
    super.key,
    required this.list,
    required this.selectedList,
    required this.cubit,
  });

  final SignUpPreferenceCubit cubit;
  final List<String> list;
  final List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<SignUpPreferenceCubit, SignUpPreferenceState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
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
                          side: const BorderSide(
                              width: 2, color: AppColors.lightGrey),
                          onSelected: (value) {
                            cubit.updatePreference(selectedList, label);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
