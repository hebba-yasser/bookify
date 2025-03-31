import 'package:bookify/core/views/widgets/square_book_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../../utils/functions/Navigaor_push.dart';
import '../book_details_view.dart';

class SquareBooksListView extends StatelessWidget {
  const SquareBooksListView({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, //270
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      context,
                      BookDetailsView(
                        book: books[index],
                      ));
                },
                child: SquareBookItem(
                  book: books[index],
                )),
          );
        },
      ),
    );
  }
}
