// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginBase on _LoginBase, Store {
  Computed<String>? _$usernameComputed;

  @override
  String get username => (_$usernameComputed ??=
          Computed<String>(() => super.username, name: '_LoginBase.username'))
      .value;
  Computed<String>? _$passwordComputed;

  @override
  String get password => (_$passwordComputed ??=
          Computed<String>(() => super.password, name: '_LoginBase.password'))
      .value;

  late final _$_usernameAtom =
      Atom(name: '_LoginBase._username', context: context);

  @override
  String get _username {
    _$_usernameAtom.reportRead();
    return super._username;
  }

  @override
  set _username(String value) {
    _$_usernameAtom.reportWrite(value, super._username, () {
      super._username = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: '_LoginBase._password', context: context);

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$isAuthenticatedAtom =
      Atom(name: '_LoginBase.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$stateAtom = Atom(name: '_LoginBase.state', context: context);

  @override
  LoadingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginBaseActionController =
      ActionController(name: '_LoginBase', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction(
        name: '_LoginBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction(
        name: '_LoginBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
state: ${state},
username: ${username},
password: ${password}
    ''';
  }
}
