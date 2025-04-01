import 'package:bloc/bloc.dart';
import 'package:bookify/core/cubits/user_data_cubit/user_data_state.dart';

import '../../data/repos/shared_repo.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final SharedRepo sharedRepos;

  UserDataCubit(this.sharedRepos) : super(UserDataInitial());

  Future<void> fetchUserData({required String id}) async {
    //  emit(UserDataLoading());
    bool isFirstEmission = true;
    sharedRepos.fetchUserData(id: id).listen((result) {
      result.fold(
        (failure) {
          print(failure.errMessage);
          emit(UserDataFailure(failure.errMessage));
        },
        (user) {
          print('here');
          if (isFirstEmission) {
            emit(UserDataLoading()); // Emit loading only once
            isFirstEmission = false;
          }
          emit(UserDataSuccess(user));
        },
      );
    });
  }
}
