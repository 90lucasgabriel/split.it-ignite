import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:splitit/modules/login/login_state.dart';
import 'package:splitit/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();

  VoidCallback onUpdate;

  LoginController({
    required this.onUpdate,
  });

  Future<void> signInGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      state = LoginStateLoading();
      onUpdate();

      final response = await _googleSignIn.signIn();

      state = LoginStateSuccess(user: UserModel.google(response!));
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
