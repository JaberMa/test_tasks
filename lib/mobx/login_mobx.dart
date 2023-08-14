import 'package:mobx/mobx.dart';
part 'login_mobx.g.dart';

class LoginBase = _LoginBase with _$LoginBase;

abstract class _LoginBase with Store {
  @observable
  String _username = '';
  @observable
  String _password = '';
  @observable
  bool isAuthenticated = false;

  @computed
  String get username => _username;
  @computed
  String get password => _password;

  @action
  void setUsername(String value) {
    _username = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @action
  Future<bool> login() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_username.isNotEmpty && _password.isNotEmpty && _password == '1234') {
      return true;
    } else {
      return false;
    }
  }
}
