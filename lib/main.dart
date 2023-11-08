import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tasks/screens/auth_screen/login_screen.dart';
import 'package:test_tasks/utils/app_theme.dart';
import 'package:test_tasks/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'mobx/login_store/login_mobx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => Provider<LoginBase>(
      create: (_) => LoginBase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'test',
        theme: AppTheme.darkTheme,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: LoginScreen.logInScreen,
      ));
}
