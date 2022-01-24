import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import 'package:splitit/modules/login/login_controller.dart';
import 'package:splitit/modules/login/login_service.dart';
import 'package:splitit/modules/login/login_state.dart';
import 'package:splitit/modules/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  group('Login Screen', () {
    late LoginController controller;
    late LoginService service;

    setUp(() {
      service = LoginServiceMock();
      controller = LoginController(
        service: service,
      );
    });

    test('It should Google Signin success.', () async {
      // Arrange
      final states = <LoginState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(service.signinGoogle).thenAnswer(
          (_) async => UserModel(id: 'id', email: 'email@google.com'));

      await controller.signInGoogle();

      // Assert
      expect(states[0], isInstanceOf<LoginStateEmpty>());
      expect(states[1], isInstanceOf<LoginStateLoading>());
      expect(states[2], isInstanceOf<LoginStateSuccess>());
      expect(states.length, 3);
    });

    test('It should Google Signin error.', () async {
      // Arrange
      final states = <LoginState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(service.signinGoogle).thenThrow('error');
      await controller.signInGoogle();

      // Assert
      expect(states[0], isInstanceOf<LoginStateEmpty>());
      expect(states[1], isInstanceOf<LoginStateFailure>());
      expect((states[1] as LoginStateFailure).message, 'error');
      expect(states.length, 2);
    });
  });
}
