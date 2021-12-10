import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:splitit/modules/home/models/dashboard.dart';
import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/widgets/app_bar/controller.dart';
import 'package:splitit/modules/home/widgets/app_bar/state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  group('Home Screen', () {
    late AppBarController controller;
    late HomeRepository repository;

    setUp(() {
      repository = HomeRepositoryMock();
      controller = AppBarController(
        homeRepository: repository,
      );
    });

    test('It should getDashboard success.', () async {
      // Arrange
      when(repository.getDashboard).thenAnswer(
        (_) async => HomeDashboardModel(
          positive: 100,
          negative: -50,
        ),
      );

      // Act
      await controller.getDashboard(() {});

      // Assert
      expect(controller.state, isInstanceOf<AppBarStateSuccess>());
    });

    test('It should getDashboard error.', () async {
      // Arrange
      when(repository.getDashboard).thenThrow('error');

      // Act
      await controller.getDashboard(() {});

      // Assert
      expect(controller.state, isInstanceOf<AppBarStateFailure>());
      expect((controller.state as AppBarStateFailure).message, 'error');
    });
  });
}
