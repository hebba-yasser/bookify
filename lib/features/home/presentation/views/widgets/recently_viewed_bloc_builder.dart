import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/data/models/user_model/small_book_model.dart';
import '../../../../../core/styles/fonts.dart';
import 'books_cover_list_view.dart';

//
// class RecentlyViewedBlocBuilder extends StatelessWidget {
//   const RecentlyViewedBlocBuilder({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserDataCubit, UserDataState>(
//       builder: (context, state) {
//         if (state is UserDataSuccess) {
//           if (state.user.recentlyViewed!.isEmpty) {
//             return SizedBox();
//           }
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 child: Text(
//                   'Recently viewed',
//                   style: AppFonts.heading20,
//                 ),
//               ),
//               BooksCoverListView(
//                 list: state.user.recentlyViewed,
//               ),
//             ],
//           );
//         } else {
//           return const Center(
//               child: CircularProgressIndicator(
//             color: Colors.white,
//           ));
//         }
//       },
//     );
//   }
// }
class RecentlyViewedBlocBuilder extends StatelessWidget {
  const RecentlyViewedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserDataCubit, UserDataState, List<SmallBookModel>?>(
      selector: (state) {
        if (state is UserDataSuccess) {
          return state.user.recentlyViewed;
        }
        return null;
      },
      builder: (context, recentlyViewed) {
        if (recentlyViewed == null || recentlyViewed.isEmpty) {
          return SizedBox(); // No rebuild when other user data changes
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'Recently viewed',
                style: AppFonts.heading20,
              ),
            ),
            BooksCoverListView(list: recentlyViewed),
          ],
        );
      },
    );
  }
}
