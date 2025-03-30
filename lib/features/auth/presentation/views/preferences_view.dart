import 'package:bookify/features/auth/presentation/views/widgets/sign_up_preferences_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class SignUpPreferencesView extends StatelessWidget {
  const SignUpPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpPreferenceCubit(
        getIt.get<AuthRepoImp>(),
      ),
      child: Scaffold(
        body: SignUpPreferencesViewBody(),
      ),
    );
  }
}
