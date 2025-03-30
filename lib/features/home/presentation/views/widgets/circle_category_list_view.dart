import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/features/home/data/data_source/authors_data_source.dart';
import 'package:bookify/features/home/data/models/author_model/author_model.dart';
import 'package:flutter/material.dart';

import '../author_books_view.dart';
import 'circle_item.dart';

class CircleCategoryListView extends StatelessWidget {
  const CircleCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AuthorDataSource.popularAuthors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
            child: GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    AuthorBooksView(
                      author: AuthorModel(
                          authorName:
                              AuthorDataSource.popularAuthors[index].authorName,
                          authorImagePath: AuthorDataSource
                              .popularAuthors[index].authorImagePath),
                    ));
              },
              child: CircleItem(
                author: AuthorDataSource.popularAuthors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
