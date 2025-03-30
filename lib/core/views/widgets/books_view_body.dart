import 'package:flutter/material.dart';

import 'books_list_view_gen.dart';
import 'custom_app_bar.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        children: [
          CustomAppBar(title: title),
          const BooksListViewGen(),
        ],
      ),
    );
  }
}
