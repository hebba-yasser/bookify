import 'package:flutter/material.dart';

import '../../../../../core/data/models/user_model/small_book_model.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/views/book_details_view.dart';
import '../../../../../core/views/widgets/custom_book_image.dart';

class BooksCoverListView extends StatelessWidget {
  const BooksCoverListView({
    super.key,
    required this.list,
  });
  final List<SmallBookModel>? list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 0, bottom: 0),
            child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      context,
                      BookDetailsView(
                        bookId: list![index].id!,
                      ));
                },
                child: CustomBookImage(image: list?[index].image ?? '')),
          );
        },
      ),
    );
  }
}
