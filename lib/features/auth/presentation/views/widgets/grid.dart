import 'package:flutter/material.dart';

import 'grid_item.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    this.list,
    this.selectedList,
  });

  final list;
  final selectedList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      left: 0,
      right: 0,
      bottom: 0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final subCategory = list.subCategories[index];
          return GridItem(
            label: subCategory.subCategoryName,
            selectedList: selectedList,
            title: subCategory.subCategoryName,
            image: subCategory.subCategoryImagePath,
            onTap: () {},
          );
        },
        itemCount: list.subCategories.length,
      ),
    );
  }
}
