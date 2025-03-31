import 'package:bookify/features/search/presentation/views/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/models/book_model/book_model.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key, required this.books}) : super(key: key);
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SearchResultViewBody(
        books: books,
      )),
    );
  }
}
