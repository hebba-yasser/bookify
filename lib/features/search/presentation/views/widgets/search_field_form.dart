import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../search_result_view.dart';

class SearchFieldForm extends StatefulWidget {
  const SearchFieldForm({Key? key}) : super(key: key);

  @override
  State<SearchFieldForm> createState() => _SearchFieldFormState();
}

class _SearchFieldFormState extends State<SearchFieldForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        controller: searchController,
        prefixIcon: FontAwesomeIcons.magnifyingGlass,
        prefixIconColor: kPrimaryColor,
        hintText: 'Search by book,author,genre...',
        hintStyle: AppFonts.caption,
        onFieldSubmitted: (newValue) {
          if (newValue!.isNotEmpty) {
            searchController.clear();
            navigatorPush(
                context,
                SearchResultView(
                  Query: newValue,
                ));
          }
        },
      ),

      //  const ResentSearchList(),
    );
  }
}
