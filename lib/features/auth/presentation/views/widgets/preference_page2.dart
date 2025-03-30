import 'package:bookify/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:bookify/features/auth/presentation/views/widgets/preference_page3.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/data_sources/preferences_data_source.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';

class PreferencePage2 extends StatelessWidget {
  const PreferencePage2({
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
              PreferencePage3(
                cubit: cubit,
              ));
        },
        footer: "Which languages do you prefer for reading?",
        center: "75%",
        percent: .75,
        list: PreferencesDataSource.supportedLanguages
            .map((lang) => lang["name"] as String)
            .toList(),
        selectedList: cubit.languagesCode,
        cubit: cubit,
      ),
    );
  }
}
