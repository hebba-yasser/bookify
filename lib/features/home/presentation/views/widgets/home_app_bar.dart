import 'package:bookify/features/home/presentation/views/widgets/custom_search_bar_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/assets.dart';
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
          BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserDataSuccess) {
                return ListTile(
                  horizontalTitleGap: 0,
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  leading: CircleAvatar(
                    radius: 32,
                    backgroundImage: state.user.imgUrl != null &&
                            state.user.imgUrl!.isNotEmpty
                        ? CachedNetworkImageProvider(
                            state.user.imgUrl!,
                            errorListener: (e) {
                              const Icon(Icons.error);
                            },
                          )
                        : const AssetImage(AppAssets.noImage),
                  ),
                  trailing: const CustomNotificationButton(),
                  title: Text(
                    'HELLO , ${state.user.name}',
                    style: AppFonts.bodyText16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'let\'s start reading  ...',
                    style: AppFonts.caption.copyWith(color: Colors.white),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
            },
          ),
          CustomSearchBarContainer(),
        ],
      ),
    );
  }
}
