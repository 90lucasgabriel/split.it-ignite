import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:splitit/modules/splash/splash_page.dart';
import 'package:splitit/modules/login/login_page.dart';
import 'package:splitit/modules/error/error_page.dart';
import 'package:splitit/modules/home/home_page.dart';
import 'package:splitit/modules/create_split/create_split_page.dart';

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
        '/home': (context) => const HomePage(),
        '/create_split': (context) => const CreateSplitPage(),
      },
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
