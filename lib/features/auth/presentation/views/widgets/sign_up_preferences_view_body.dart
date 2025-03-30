import 'package:bookify/features/auth/presentation/views/widgets/preference_page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/Preference_Cubit/sign_up_preference _state.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class SignUpPreferencesViewBody extends StatelessWidget {
  const SignUpPreferencesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPreferenceCubit, SignUpPreferenceState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SignUpPreferenceCubit>(context);
        return PreferencePage1(
          cubit: cubit,
        );
      },
    );
  }
}
