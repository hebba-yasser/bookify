import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/views/widgets/custom_circle_button.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCircleButton(
          onPressed: () {},
          icon: Icons.notifications_active_outlined,
          backgroundColor: AppColors.lightGrey,
          clickColor: AppColors.lightGrey,
          iconColor: Colors.black,
          radius: 24,
        ),
        const Positioned(
          right: 2,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 7,
          ),
        )
      ],
    );
  }
}
