import 'package:bloc/bloc.dart';
import 'package:bookify/core/cubits/user_data_cubit/user_data_state.dart';

import '../../data/repos/shared_repo.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final SharedRepo sharedRepos;

  UserDataCubit(this.sharedRepos) : super(UserDataInitial());

  void fetchUserData({required String id}) {
    emit(UserDataLoading());
    sharedRepos.fetchUserData(id: id).listen((result) {
      result.fold(
        (failure) {
          emit(UserDataFailure(failure.errMessage));
        },
        (user) {
          emit(UserDataSuccess(user));
        },
      );
    });
  }
}
