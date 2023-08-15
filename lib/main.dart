import 'package:flutter/material.dart';
import 'package:test_tasks/utils/app_theme.dart';
import 'package:test_tasks/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';


void main() {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      title: 'test',
      theme: AppTheme.darkTheme,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.signIn,
    );
  }
}
