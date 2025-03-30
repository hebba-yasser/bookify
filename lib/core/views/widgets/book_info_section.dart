import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../data/models/book_model/book_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import 'expandable_text.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'About The Book',
            style: AppFonts.bodyText18
                .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ExpandableText(
            text:
                bookModel.volumeInfo?.description ?? 'No Description Available',
            style: AppFonts.bodyText16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Pages',
                  style: AppFonts.bodyText18.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
                Text(
                  bookModel.volumeInfo?.pageCount.toString() ?? ' ',
                  style: AppFonts.bodyText16.copyWith(),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Language',
                  style: AppFonts.bodyText18.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
                Text(
                  bookModel.volumeInfo?.language ?? ' ',
                  style: AppFonts.bodyText16.copyWith(),
                ),
              ],
            ),
            if (bookModel.volumeInfo!.previewLink != null)
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    child: IconButton(
                        color: kPrimaryColor,
                        onPressed: () async {
                          final Uri url =
                              Uri.parse(bookModel.volumeInfo!.previewLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        icon: Icon(CupertinoIcons.book_solid)),
                  ),
                  Text(
                    'Preview',
                    style: AppFonts.bodyText16.copyWith(),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
