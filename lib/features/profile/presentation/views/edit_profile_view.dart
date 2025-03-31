import 'package:bookify/features/profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/user_model/user_model.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/profile_repos_imp.dart';
import '../manager/update_profile_cubit/update_profile_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(
        getIt.get<ProfileReposImp>(),
        user,
      ),
      child: const Scaffold(
        body: SafeArea(child: EditProfileViewBody()),
      ),
    );
  }
}
