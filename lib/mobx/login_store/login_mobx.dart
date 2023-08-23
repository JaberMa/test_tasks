import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../enum_state.dart';
part 'login_mobx.g.dart';

class LoginBase = _LoginBase with _$LoginBase;

abstract class _LoginBase with Store {
  @observable
  String _username = '';
  @observable
  String _email = '';
  @observable
  String _password = '';
  @observable
  bool isAuthenticated = false;
  @observable
  LoadingState state = LoadingState.none;
  @computed
  String get username => _username;
  @computed
  String get email => _email;
  @computed
  String get password => _password;

  @action
  void setUsername(String value) {
    _username = value;
  }

  @action
  void setEmail(String value) {
    _email = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @action
  Future<bool> login() async {
    state = LoadingState.loading;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      state = LoadingState.none;
      return true;
    } on FirebaseAuthException catch (e) {
      print("error message ==${e.message}");
      state = LoadingState.none;
      return false;
    }
  }

  Future<bool> singup() async {
    state = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      state = LoadingState.none;
      return true;
    } on FirebaseAuthException catch (e) {
      print("error${e.message}");
      state = LoadingState.none;
      return false;
    }
  }
}
