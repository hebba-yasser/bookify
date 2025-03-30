import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bookify/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const SplashViewBody(),
        nextScreen: isLogged ? const HomeView() : const OnboardingView(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kPrimaryColor,
        splashIconSize: 300,
        duration: 2000);
  }
}
