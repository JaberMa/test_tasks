import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';
import '../../screens/home_screen/login_screen.dart';

class Routes {
  static const String signIn = '/login';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
