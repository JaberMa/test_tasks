import 'package:test_tasks/utils/routes.dart';
import '../../mixins/snack_mixin.dart';
import 'package:flutter/material.dart';
import 'package:test_tasks/screens/home_screen/components/msg_welcome.dart';
import 'package:test_tasks/utils/constants/app_strings.dart';
import '../../mobx/login_mobx.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with SnackMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authStore = LoginBase();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.turn_left),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MsgWelcome(
                headlineWelcome: AppStrings.headlineWelcome,
                messageWelcome:
                    "${AppStrings.messageWelcome.tr()}\n${AppStrings.messageWelcome2.tr()}"),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username'.tr(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your username'.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password'.tr(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password'.tr();
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(children: [
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppStrings.instructionMsg,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Text(" Register".tr()),
                        ),
                      ],
                    )),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          'Login'.tr(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            authStore.setUsername(_usernameController.text);
                            authStore.setPassword(_passwordController.text);
                            bool canLogin = await authStore.login();
                            if (canLogin && mounted) {
                              showSuccess(
                                  context, AppStrings.loginSuccessMessage.tr());
                              Navigator.pushNamed(context, Routes.home);
                            } else {
                              showError(
                                  context, AppStrings.loginErrorMessage.tr());
                            }
                          }
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
