import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: const Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
