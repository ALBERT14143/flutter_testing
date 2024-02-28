import 'package:flutter/material.dart';
import 'package:test_login_api/screens/home/home.dart';
import 'package:test_login_api/screens/login/login.dart';
import 'package:test_login_api/splash.dart';

class AppRoute{
  Route onRouteGenerate(RouteSettings settings){
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        // break;

      case LoginPage.id:
        return MaterialPageRoute(builder: (context) => const LoginPage());
        // break;

      case HomeScreen.id:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default: 
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}