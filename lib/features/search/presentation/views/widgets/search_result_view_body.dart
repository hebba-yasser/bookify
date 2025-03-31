import 'package:bookify/core/views/widgets/books_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/views/widgets/custom_app_bar.dart';
import 'filter_container.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({Key? key, required this.books}) : super(key: key);
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        children: [
          CustomAppBar(title: 'Search Results '),
          Expanded(child: BooksGridView(books: books)),
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
