import 'package:flutter/material.dart';

import 'package:splitit/modules/login/login_controller.dart';
import 'package:splitit/modules/login/login_service.dart';
import 'package:splitit/modules/login/login_state.dart';

import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
      service: LoginServiceImpl(),
      onUpdate: () {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;
          Navigator.pushReplacementNamed(context, '/home', arguments: user);

          return;
        }
        setState(() {});
      },
    );

    super.initState();
  }

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
                SocialButtonWidget(
                  imagePath: 'assets/images/google.png',
                  label: 'Entrar com Google',
                  onTap: controller.signInGoogle,
                ),
              ],
            ),
          ),
          if (controller.state is LoginStateLoading)
            const CircularProgressIndicator(),
          if (controller.state is LoginStateFailure)
            Text((controller.state as LoginStateFailure).message),
        ],
      ),
    );
  }
}
