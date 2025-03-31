import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import '../filter_view.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorPush(
            context,
            FilterView(
              fetchSearchBookCubit: context.read<FetchSearchBookCubit>(),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Filter',
              style: AppFonts.bodyText16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.tune_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
