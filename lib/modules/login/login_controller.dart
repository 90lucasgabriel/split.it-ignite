import 'package:flutter/material.dart';
import 'package:splitit/modules/login/login_service.dart';

import 'package:splitit/modules/login/login_state.dart';
import 'package:splitit/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();

  VoidCallback onUpdate;
  final LoginService service;

  LoginController({
    required this.onUpdate,
    required this.service,
  });

  Future<void> signInGoogle() async {
    try {
      state = LoginStateLoading();
      onUpdate();

      final user = await service.signinGoogle();
      state = LoginStateSuccess(user: user);
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
