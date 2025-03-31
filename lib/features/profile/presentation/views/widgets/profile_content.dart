import 'package:bookify/features/profile/presentation/views/widgets/profile_list_tile_item.dart';
import 'package:bookify/features/profile/presentation/views/widgets/user_profile_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../change_password_view.dart';
import '../edit_profile_view.dart';
import 'log_out_listener.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .2,
      left: 0,
      right: 0,
      child: Column(
        children: [
          UserProfileData(
            user: user,
          ),
          ProfileListTileItem(
            title: 'Edit Profile',
            leadingIcon: FontAwesomeIcons.userPen,
            onTap: () {
              navigatorPush(
                  context,
                  EditProfileView(
                    user: user,
                  ));
            },
          ),
          //   const CustomDivider(),
          ProfileListTileItem(
            title: 'Change Password',
            leadingIcon: CupertinoIcons.lock_fill,
            onTap: () {
              navigatorPush(context, const ChangePasswordView());
            },
          ),
          //     const CustomDivider(),
          const LogOutListener(),
        ],
      ),
    );
  }
}
