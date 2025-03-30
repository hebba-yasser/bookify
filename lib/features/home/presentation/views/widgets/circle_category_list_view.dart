import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
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
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
            child: GestureDetector(
              onTap: () {},
              child: CircleItem(
                title: 'auther name ',
                imagePath: AppAssets.noImage,
              ),
            ),
          );
        },
      ),
    );
  }
}
