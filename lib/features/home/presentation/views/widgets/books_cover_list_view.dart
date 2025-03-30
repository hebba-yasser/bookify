import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/views/book_details_view.dart';
import '../../../../../core/views/widgets/custom_book_image.dart';

class BooksCoverListView extends StatelessWidget {
  const BooksCoverListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                child: CustomBookImage(image: AppAssets.books)),
          );
        },
      ),
    );
  }
}
