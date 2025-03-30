import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepo,
  ) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(AuthRegisterLoading());
    var result = await authRepo.register(
        email: email, password: password, name: name, phone: phone);
    result.fold(((failure) {
      emit(AuthRegisterFailure(errMess: failure.errMessage));
    }), ((success) {
      emit(AuthRegisterSuccess());
    }));
  }

  bool isHidden = true;
  IconData suffixIcon = Icons.visibility_off;

  void togglePasswordVisibility() {
    isHidden = !isHidden;
    suffixIcon = isHidden ? Icons.visibility_off : Icons.visibility;
    emit(AuthTogglePasswordVisibility());
  }
}
