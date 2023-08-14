import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tasks/screens/home_screen/components/msg_welcome.dart';
import 'package:test_tasks/utils/constants/app_strings.dart';
import '../../providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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
    final model = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.turn_left),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const MsgWelcome(
                headlineWelcome: AppStrings.headlineWelcome,
                messageWelcome: AppStrings.messageWelcome),
            const SizedBox(
              height: 54,
            ),
            Expanded(
              flex: 7,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
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
                    child: const Text(" Register"),
                  ),
                ],
              )),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      model.setUsername(_usernameController.text);
                      model.setPassword(_passwordController.text);
                      bool canLogin = await model.login();
                      if (canLogin && mounted) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cannot login! wrong credentials!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
