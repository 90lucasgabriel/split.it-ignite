import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, '/login');
    } catch (error) {
      Navigator.pushNamed(context, '/error');
    }
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.gradients.background),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/rectangle-left.png',
                    width: 198,
                    height: 98,
                  ),
                )
              ]),
              Row(children: [
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/rectangle-left.png',
                    width: 114,
                    height: 54,
                  ),
                )
              ]),
              Center(
                child: Image.asset('assets/images/logo.png',
                    width: 128, height: 112),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/rectangle-right.png',
                      width: 114,
                      height: 54,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/rectangle-right.png',
                      width: 198,
                      height: 98,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
