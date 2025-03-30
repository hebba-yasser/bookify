import 'package:bookify/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/Auth_cubit/auth_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepoImp>()),
      child: const Scaffold(
        body: SafeArea(child: SignUpViewBody()),
      ),
    );
  }
}
