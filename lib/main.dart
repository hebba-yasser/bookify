import 'package:bookify/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'core/styles/colors.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Bookify());
}

class Bookify extends StatelessWidget {
  const Bookify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
