import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:bookify/features/auth/presentation/views/widgets/preference_page2.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/data_sources/preferences_data_source.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencePage1 extends StatelessWidget {
  const PreferencePage1({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final SignUpPreferenceCubit cubit;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: PreferenceItem(
        onPressed: () {
          navigatorPush(
              context,
              PreferencePage2(
                cubit: cubit,
              ));
        },
        footer: "What type of books do you love to read?",
        center: "50%",
        percent: .50,
        list: PreferencesDataSource.genres,
        selectedList: cubit.genres,
        cubit: cubit,
      ),
    );
  }
}
