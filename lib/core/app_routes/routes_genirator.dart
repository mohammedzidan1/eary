import 'package:eary/core/app_routes/routes_mames.dart';
import 'package:eary/modules/authontication/view/login/login_screen.dart';
import 'package:eary/modules/authontication/view/on_bording/on_boarding_screen.dart';
import 'package:eary/modules/authontication/view/register/register_screen.dart';
import 'package:eary/modules/authontication/view/register_or_login/register_or_login.dart';
import 'package:eary/modules/home/view/home_screen.dart';
import 'package:eary/modules/search/view/search_page.dart';
import 'package:eary/splash.dart';
import 'package:flutter/material.dart';

class AppRouts {
  Route? genirateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutsNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutsNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RoutsNames.authentication:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case RoutsNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutsNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutsNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutsNames.search:
        return MaterialPageRoute(builder: (_) => const SearchPage());
    }
    //
  }
}
