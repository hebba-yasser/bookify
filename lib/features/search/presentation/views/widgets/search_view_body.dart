import 'package:bookify/features/search/presentation/views/widgets/resent_search_section.dart';
import 'package:bookify/features/search/presentation/views/widgets/search_field_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/search_repo_imp.dart';
import '../../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import '../../manager/update_recent_search_cubit/update_recent_search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateRecentSearchCubit(
            getIt.get<SearchRepoImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchSearchBookCubit(getIt.get<SearchRepoImp>(),
              context.read<UpdateRecentSearchCubit>()),
        ),
      ],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SearchFieldForm(),
          ),
          Expanded(
            child: ResentSearchSection(),
          ),
        ],
      ),
    );
  }
}
