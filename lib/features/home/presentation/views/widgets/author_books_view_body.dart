import 'package:bookify/constants.dart';
import 'package:bookify/core/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/views/widgets/books_grid_view.dart';
import 'author_info_section.dart';

class AuthorBooksViewBody extends StatelessWidget {
  const AuthorBooksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Author Details'),
          AuthorInfoSection(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10),
            child: Text(
              'Author\'s Books',
              style: AppFonts.heading20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 3,
            color: kPrimaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: BooksGridView(),
            ),
          )
        ],
      ),
    );
  }
}
