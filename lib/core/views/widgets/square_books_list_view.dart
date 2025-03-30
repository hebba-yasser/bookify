import 'package:bookify/core/views/widgets/square_book_item.dart';
import 'package:flutter/material.dart';

import '../../utils/functions/Navigaor_push.dart';
import '../book_details_view.dart';

class SquareBooksListView extends StatelessWidget {
  const SquareBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: MediaQuery.of(context).size.height * .4,
      height: 300, //270
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
                onTap: () {
                  navigatorPush(context, BookDetailsView());
                },
                child: SquareBookItem()),
          );
        },
      ),
    );
  }
}
