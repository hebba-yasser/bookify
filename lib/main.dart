import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'core/styles/colors.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppCubitObserver();
  await CacheHelper.init();
  setupServiceLocator();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const Bookify(),
  ));
}

class Bookify extends StatelessWidget {
  const Bookify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      color: kPrimaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(primary: kPrimaryColor),
        unselectedWidgetColor: AppColors.lightTeal.withOpacity(0.6),
        disabledColor: AppColors.lightGrey,
        indicatorColor: kPrimaryColor,
        hoverColor: AppColors.lightGrey,
        shadowColor: AppColors.lightGrey,
        focusColor: AppColors.lightGrey,
        splashColor: AppColors.lightGrey,
        dialogBackgroundColor: Colors.white,
        secondaryHeaderColor: AppColors.lightGrey,
        canvasColor: Colors.white,
        highlightColor: AppColors.lightGrey,
        cardColor: AppColors.lightGrey,
        primaryColorLight: AppColors.lightTeal,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kPrimaryColor, // Matches main theme
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold), // Enhances visibility
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
