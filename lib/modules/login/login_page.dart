import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(32),
                width: 220,
                child: Text(
                  'Divida suas contas com seus amigos',
                  style: AppTheme.textStyles.title,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  'Faça seu login com uma das contas abaixo',
                  style: AppTheme.textStyles.text,
                ),
                const SizedBox(height: 32),
                const SocialButtonWidget(
                  imagePath: 'assets/images/google.png',
                  label: 'Entrar com Google',
                ),
                const SizedBox(height: 12),
                const SocialButtonWidget(
                  imagePath: 'assets/images/apple.png',
                  label: 'Entrar com Apple',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
