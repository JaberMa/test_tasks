import 'package:flutter/material.dart';
import 'package:test_tasks/screens/auth_screen/signup_screen.dart';
import '../../screens/home_screen.dart';
import '../screens/auth_screen/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.logInScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case HomeScreen.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SingupScreen.singUpScreen:
        return MaterialPageRoute(builder: (context) => const SingupScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
