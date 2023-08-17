import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../mixins/snack_mixin.dart';
import 'package:flutter/material.dart';
import 'package:test_tasks/screens/login_screen/components/msg_welcome.dart';
import 'package:test_tasks/utils/constants/app_strings.dart';
import '../../mobx/login_mobx.dart';
import 'package:easy_localization/easy_localization.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String logInScreen = '/login';
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with SnackMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authInfo = Provider.of<LoginBase>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.turn_left),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
           const MsgWelcome(
                headlineWelcome:
               
                    "${AppStrings.messageWelcome}"),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Phone,Username or Email'.tr(),
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
                      suffixIcon: GestureDetector(
                        onTap: () => toggleObscureText(),
                        child: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      labelText: 'Password'.tr(),
                    ),
                    obscureText: obscureText,
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
            const Expanded(child: SizedBox()),
            Observer(
              builder: (context) {
                return Column(children: [
                  Row(
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
                  ),
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
                          authInfo.setUsername(_usernameController.text);
                          authInfo.setPassword(_passwordController.text);
                          print(authInfo.password);

                          bool canLogin = await authInfo.login();
                          if (canLogin && mounted) {
                            showSuccess(
                                context, AppStrings.loginSuccessMessage.tr());
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.homeScreen);
                          } else {
                            showError(
                                context, AppStrings.loginErrorMessage.tr());
                          }
                        }
                      },
                    ),
                  ),
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
