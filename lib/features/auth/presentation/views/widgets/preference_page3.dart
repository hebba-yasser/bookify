import 'package:bookify/features/auth/presentation/manager/Preference_Cubit/sign_up_preference%20_state.dart';
import 'package:bookify/features/auth/presentation/views/widgets/preferences_rotated_image.dart';
import 'package:bookify/features/auth/presentation/views/widgets/skip_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_button.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigator_to_auth.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/Preference_Cubit/sign_up_preference_cubit.dart';
import '../sign_in_view.dart';
import 'indicator.dart';

class PreferencePage3 extends StatefulWidget {
  const PreferencePage3({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final SignUpPreferenceCubit cubit;

  @override
  State<PreferencePage3> createState() => _PreferencePage3State();
}

class _PreferencePage3State extends State<PreferencePage3> {
  final TextEditingController favAuthorsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<SignUpPreferenceCubit, SignUpPreferenceState>(
        listener: (context, state) {
          if (state is SignUpSavePreferencesSuccess) {
            navigatorPushAndRemove(context, const SignInView());
          }
          if (state is SignUpSavePreferencesError) {
            customShowToast(state.errMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                PreferencesRotatedImage(),
                SkipButton(
                  selectedList: widget.cubit.favoriteAuthors,
                  onPressed: () {
                    widget.cubit.updateUserPreferences();
                  },
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
                          onFieldSubmitted: (newValue) {
                            if (newValue!.isNotEmpty &
                                newValue.trim().isNotEmpty) {
                              widget.cubit.selectFavAuthor(newValue);
                              favAuthorsController.clear();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please write an ingredient';
                            }
                            return null;
                          },
                          controller: favAuthorsController,
                        ),
                      ),
                      IntrinsicHeight(
                        child: SelectedAuthorsList(
                          onPressed: widget.cubit.removeFavAuthor,
                          authorsList: widget.cubit.favoriteAuthors,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SelectedAuthorsList extends StatelessWidget {
  const SelectedAuthorsList({
    super.key,
    required this.authorsList,
    required this.onPressed,
  });
  final List authorsList;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Wrap(
        direction: Axis.vertical,
        children: List.generate(
          (authorsList.length),
          (index) {
            return Row(
              children: [
                Text(
                  authorsList[index],
                  style:
                      AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
                ),
                CustomTextButton(
                    text: 'clear',
                    style: AppFonts.caption.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      onPressed(authorsList[index]);
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
