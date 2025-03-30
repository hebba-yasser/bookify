import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../manager/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>(
      create: (context) => BottomNavigationCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<BottomNavigationCubit>(context);
            return SafeArea(child: cubit.bottomNavScreens[cubit.currentIndex]);
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<BottomNavigationCubit>(context);

            return BottomNavigationBar(
              backgroundColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.bookOpenReader), label: 'Home'),
                const BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                    ),
                    label: 'search'),
                const BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.bookOpen), label: 'Library'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: 'Explore'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 20,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.black54,
            );
          },
        ),
      ),
    );
  }
}
