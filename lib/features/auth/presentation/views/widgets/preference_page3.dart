import 'package:bookify/features/auth/presentation/views/widgets/preferences_rotated_image.dart';
import 'package:bookify/features/auth/presentation/views/widgets/skip_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';
import 'indicator.dart';

class PreferencePage3 extends StatefulWidget {
  const PreferencePage3({
    Key? key,
  }) : super(key: key);

  @override
  State<PreferencePage3> createState() => _PreferencePage3State();
}

class _PreferencePage3State extends State<PreferencePage3> {
  final TextEditingController favAuthorsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PreferencesRotatedImage(),
          SkipButton(
            selectedList: [],
            onPressed: () {},
          ),
          const Indicator(
            footer: 'Who are your favorite authors?',
            center: '100%',
            percent: 1,
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormField(
                    prefixIcon: CupertinoIcons.nosign,
                    prefixIconColor: kPrimaryColor,
                    hintText: 'favourite  Authors',
                    hintStyle: AppFonts.caption,
                    keyboardText: TextInputType.text,
                    onFieldSubmitted: (newValue) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please write an ingredient';
                      }
                      return null;
                    },
                    controller: favAuthorsController,
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
