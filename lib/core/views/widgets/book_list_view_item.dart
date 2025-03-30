import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../../styles/colors.dart';
import 'book_title_author.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10)),
        height: 170,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.2 / 3,
                child: CustomBookImage(
                    image: book.volumeInfo?.imageLinks?.thumbnail ?? ' ')),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: BookTitleAuthor(
                book: book,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
