import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';
import '../screens/login_screen/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.logInScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case HomeScreen.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
