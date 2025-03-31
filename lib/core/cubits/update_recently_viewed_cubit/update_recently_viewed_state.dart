import 'package:flutter/cupertino.dart';

@immutable
sealed class UpdateRecentlyViewedState {}

final class UpdateRecentlyViewedInitial extends UpdateRecentlyViewedState {}

final class UpdateRecentlyViewedLoading extends UpdateRecentlyViewedState {}

final class UpdateRecentlyViewedSuccess extends UpdateRecentlyViewedState {}

final class UpdateRecentlyViewedFailure extends UpdateRecentlyViewedState {
  final String errMessage;

  UpdateRecentlyViewedFailure(this.errMessage);
}
