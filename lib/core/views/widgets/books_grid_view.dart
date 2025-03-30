import 'package:bookify/core/views/widgets/square_book_item.dart';
import 'package:flutter/material.dart';

import '../../utils/functions/Navigaor_push.dart';
import '../book_details_view.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.9 / 3,
        crossAxisCount: 2, // Specify number of columns
        crossAxisSpacing: 5, // Space between columns
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          navigatorPush(context, BookDetailsView());
        },
        child: SquareBookItem(),
      ),
      itemCount: 10,
    );
  }
}
