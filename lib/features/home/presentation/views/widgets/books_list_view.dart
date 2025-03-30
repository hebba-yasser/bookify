import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/features/home/presentation/views/widgets/book_details_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/views/book_details_view.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 0, bottom: 0),
            child: GestureDetector(
                onTap: () {
                  navigatorPush(context, BookDetailsView());
                },
                child: BookDetailsItem()),
          );
        },
      ),
    );
  }
}
