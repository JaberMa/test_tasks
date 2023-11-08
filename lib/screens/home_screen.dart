import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_tasks/screens/auth_screen/login_screen.dart';
import '../mobx/login_store/login_mobx.dart';

class HomeScreen extends StatefulWidget {
  static const String homeScreen = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authInfo = Provider.of<LoginBase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (BuildContext context) {
                return Text("${"home_msg".tr()} ${authInfo.username}!");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, LoginScreen.logInScreen);
                },
                child: const Text("LOgout"))
          ],
        ),
      ),
    );
  }
}
