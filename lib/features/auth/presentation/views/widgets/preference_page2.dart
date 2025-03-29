import 'package:bookify/features/auth/presentation/views/widgets/prefeence_item.dart';
import 'package:bookify/features/auth/presentation/views/widgets/preference_page3.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/data_sources/preferences_data_source.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';

class PreferencePage2 extends StatelessWidget {
  const PreferencePage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: PreferenceItem(
        onPressed: () {
          navigatorPush(context, PreferencePage3());
        },
        footer: "Which languages do you prefer for reading?",
        center: "75%",
        percent: .75,
        list: PreferencesDataSource.supportedLanguages
            .map((lang) => lang["name"] as String)
            .toList(),
        selectedList: [],
      ),
    );
  }
}
