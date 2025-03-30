import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles/fonts.dart';
import 'list_builder_item.dart';

class ResentSearchSection extends StatelessWidget {
  const ResentSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Search',
            style: AppFonts.caption,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListBuilderItem(
                  onpressed: () {},
                  text: 'search esult ',
                  leading: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.grey,
                    size: 16,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
