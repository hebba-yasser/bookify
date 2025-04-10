import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../profile/presentation/views/profile_view_body.dart';
import '../../../../search/presentation/views/widgets/search_view_body.dart';
import '../../views/widgets/home_view_body.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    const HomeViewBody(),
    const SearchViewBody(),
    // const LibraryViewBody(),
    // const GenresViewBody(),
    const ProfileViewBody(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
