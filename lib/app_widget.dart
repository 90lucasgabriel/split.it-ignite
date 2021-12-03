import 'package:flutter/material.dart';

import 'package:splitit/modules/splash/splash_page.dart';
import 'package:splitit/modules/login/login_page.dart';
import 'package:splitit/modules/error/error_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split.it',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/error': (context) => const ErrorPage(),
      },
    );
  }
}
