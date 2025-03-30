import 'package:flutter/material.dart';

import '../../../../../core/views/widgets/books_list_view_gen.dart';
import '../../../../../core/views/widgets/custom_app_bar.dart';
import '../filter_container.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        children: [
          CustomAppBar(title: 'Search Results '),
          const BooksListViewGen(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilterContainer(),
          ),
        ],
      ),
    );
  }
}
