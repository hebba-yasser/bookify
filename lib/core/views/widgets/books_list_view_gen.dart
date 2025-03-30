import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:flutter/material.dart';

import '../book_details_view.dart';
import 'book_list_view_item.dart';

class BooksListViewGen extends StatelessWidget {
  const BooksListViewGen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: GestureDetector(
              onTap: () {
                navigatorPush(context, BookDetailsView());
              },
              child: BookListViewItem()),
        ),
      ),
    );
  }
}
