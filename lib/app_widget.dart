import 'package:flutter/material.dart';

import 'package:splitit/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Split.it',
      home: SplashPage(),
    );
  }
}
