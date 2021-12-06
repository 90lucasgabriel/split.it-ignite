import 'package:flutter_test/flutter_test.dart';
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
        onUpdate: () {},
      );
    });

    test('It should Google Signin success.', () async {
      // Arrange
      when(service.signinGoogle).thenAnswer(
          (_) async => UserModel(id: 'id', email: 'email@google.com'));

      // Act
      await controller.signInGoogle();

      // Assert
      expect(controller.state, isInstanceOf<LoginStateSuccess>());
    });

    test('It should Google Signin error.', () async {
      // Arrange
      when(service.signinGoogle).thenThrow('error');

      // Act
      await controller.signInGoogle();

      // Assert
      expect(controller.state, isInstanceOf<LoginStateFailure>());
      expect((controller.state as LoginStateFailure).message, 'error');
    });
  });
}
