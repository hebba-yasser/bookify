import 'package:bookify/features/search/presentation/manager/fetch_search_cubit_cubit/fetch_search_states.dart';
import 'package:bookify/features/search/presentation/views/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/search_repo_imp.dart';
import '../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import '../manager/update_recent_search_cubit/update_recent_search_cubit.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key, required this.Query}) : super(key: key);
  final String Query;

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
              context.read<UpdateRecentSearchCubit>())
            ..fetchSearchBook(query: Query),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<FetchSearchBookCubit, FetchSearchBookStates>(
          builder: (context, state) {
            if (state is FetchSearchSuccess) {
              return SafeArea(
                  child: SearchResultViewBody(
                books: state.books,
              ));
            } else if (state is FetchSearchFailure) {
              return Text(state.errMessage);
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
