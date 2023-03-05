import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eary/core/utilites/firbase_auth_util.dart';
import 'package:eary/modules/authontication/view/on_bording/on_boarding_screen.dart';
import 'package:eary/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 300,
      // backgroundColor: AppColors.primaryColor,
      duration: 2500,
      splash: Image.asset(
        'assets/images/splash_logo.png',
        fit: BoxFit.fitHeight,
      ),
      nextScreen: FirebaseAuthUtil.isLogin
          ? const HomeScreen()
          : const OnBoardingScreen(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
