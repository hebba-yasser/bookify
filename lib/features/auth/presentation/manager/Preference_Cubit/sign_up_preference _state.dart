import 'package:flutter/cupertino.dart';

@immutable
sealed class SignUpPreferenceState {}

final class SignUpPreferenceInitial extends SignUpPreferenceState {}

final class SignUpPreferenceSelected extends SignUpPreferenceState {}

final class SignUpFavAuthorSelected extends SignUpPreferenceState {}

final class SignUpFavAuthorRemoved extends SignUpPreferenceState {}

final class SignUpSavePreferencesLoading extends SignUpPreferenceState {}

final class SignUpSavePreferencesSuccess extends SignUpPreferenceState {}

final class SignUpSavePreferencesError extends SignUpPreferenceState {
  final String errMessage;

  SignUpSavePreferencesError(this.errMessage);
}
