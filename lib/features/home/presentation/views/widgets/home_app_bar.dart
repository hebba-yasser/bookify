import 'package:bookify/features/home/presentation/views/widgets/custom_search_bar_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import 'custom_notification_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.boldTeal,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage('assets/images/no_image.jpg'),
            ),
            trailing: const CustomNotificationButton(),
            title: Text(
              'HELLO ,name',
              style: AppFonts.bodyText16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'let\'s start reading  ...',
              style: AppFonts.caption.copyWith(color: Colors.white),
            ),
          ),
          CustomSearchBarContainer(),
        ],
      ),
    );
  }
}
