import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/views/widgets/custom_app_bar.dart';
import 'buttons_section.dart';
import 'filter_section.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Filter'),
          Divider(
            color: kPrimaryColor,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          FilterSection(),
          SizedBox(
            height: 10,
          ),
          ButtonsSection(),
        ],
      ),
    );
  }
}
