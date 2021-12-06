import 'package:google_sign_in/google_sign_in.dart';

import 'package:splitit/modules/login/models/user_model.dart';

abstract class LoginService {
  Future<UserModel> signinGoogle();
}

class LoginServiceImpl implements LoginService {
  @override
  Future<UserModel> signinGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final response = await _googleSignIn.signIn();

    return UserModel.google(response!);
  }
}
