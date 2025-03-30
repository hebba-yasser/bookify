import 'package:bookify/features/search/presentation/views/widgets/resent_search_section.dart';
import 'package:bookify/features/search/presentation/views/widgets/search_field_form.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: SearchFieldForm(),
        ),
        Expanded(
          child: ResentSearchSection(),
        ),
      ],
    );
  }
}
