import 'package:bloc/bloc.dart';
import 'package:bookify/features/search/presentation/manager/update_recent_search_cubit/update_recent_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/search_repo.dart';

class UpdateRecentSearchCubit extends Cubit<UpdateRecentSearchState> {
  UpdateRecentSearchCubit(
    this.searchRepos,
  ) : super(UpdateRecentSearchInitial());
  final SearchRepo searchRepos;
  Future<void> updateRecentSearch({required String search}) async {
    emit(UpdateRecentSearchLoading());
    var result = await searchRepos.updateUserSearchList(search: search);
    result.fold((failure) {
      emit(UpdateRecentSearchFailure(failure.errMessage));
    }, (r) async {
      emit(UpdateRecentSearchSuccess());
    });
  }
}
