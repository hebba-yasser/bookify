import 'package:bookify/features/profile/presentation/views/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/profile_repos_imp.dart';
import '../manager/Change_password_cubit/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<ProfileReposImp>()),
      child: Scaffold(
        body: SafeArea(child: ChangePasswordViewBody()),
      ),
    );
  }
}
