import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    super.key,
  });

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
          child: Text(
            'descriptinvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvomkfnldddddaaaaakfndlfdnlfnkflfnnflklf',
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
                  '100 ',
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
                  'eng/spa',
                  style: AppFonts.bodyText16.copyWith(),
                ),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightGrey,
                  child: IconButton(
                      color: kPrimaryColor,
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.book_solid)),
                ),
                Text(
                  'ReadNow',
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
