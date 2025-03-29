import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.image,
    required this.onTap,
    this.selectedList,
    required this.label,
    required this.title,
  });

  final String title;
  final String image;
  final Function() onTap;
  final selectedList;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor:
                selectedList.contains(label) ? kPrimaryColor : Colors.grey[400],
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
                color:
                    selectedList.contains(label) ? kPrimaryColor : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
