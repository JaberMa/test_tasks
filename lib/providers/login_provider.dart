import 'package:flutter/material.dart';
/*
  A provider class that is responsible for every thing that is related
  to the user login
*/

class LoginProvider extends ChangeNotifier {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  /// Set username value
  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  /// Set password value
  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  /// A function that handles user login to the app
  Future<bool> login() async{
    await Future.delayed(const Duration(seconds: 2));
    if(_username.isNotEmpty && _password.isNotEmpty && _password == '1234'){
      return true;
    }else{
      return false;
    }
  }
}