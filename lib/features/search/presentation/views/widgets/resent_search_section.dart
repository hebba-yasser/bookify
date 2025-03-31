import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/features/search/presentation/views/search_result_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import 'list_builder_item.dart';

class ResentSearchSection extends StatelessWidget {
  const ResentSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, userState) {
        if (userState is UserDataFailure) {
          return Text(userState.errMessage);
        } else if (userState is UserDataSuccess) {
          return ConditionalBuilder(
            condition: userState.user.recentSearch!.isEmpty,
            builder: (context) => const SizedBox(),
            fallback: (context) => Padding(
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
                      itemCount: userState.user.recentSearch?.length,
                      itemBuilder: (context, index) {
                        return ListBuilderItem(
                          onpressed: () {
                            navigatorPush(
                                context,
                                SearchResultView(
                                    Query:
                                        userState.user.recentSearch![index]));
                          },
                          text: userState.user.recentSearch![index],
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
            ),
          );
        } else {
          return customLoadingIndicator();
        }
      },
    );
  }
}
