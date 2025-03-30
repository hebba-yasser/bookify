import 'package:bookify/core/views/widgets/custom_app_bar.dart';
import 'package:bookify/core/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(top: 10, left: 12, right: 12),
          child: CustomAppBar(title: ' '),
        )),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.sizeOf(context).height * .40,
            child: CustomBookImage(
                image: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ' '),
          ),
        ),
        BookDetailsSection(bookModel: bookModel),
      ],
    );
  }
}
