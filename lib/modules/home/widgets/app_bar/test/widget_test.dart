import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
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
      final states = <AppBarState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(repository.getDashboard).thenAnswer(
        (_) async => HomeDashboardModel(
          positive: 100,
          negative: -50,
        ),
      );
      await controller.getDashboard();

      // Assert
      expect(states[0], isInstanceOf<AppBarStateEmpty>());
      expect(states[1], isInstanceOf<AppBarStateLoading>());
      expect(states[2], isInstanceOf<AppBarStateSuccess>());
      expect(states.length, 3);
    });

    test('It should getDashboard error.', () async {
      // Arrange
      final states = <AppBarState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(repository.getDashboard).thenThrow('error');
      await controller.getDashboard();

      // Assert
      expect(states[0], isInstanceOf<AppBarStateEmpty>());
      expect(states[1], isInstanceOf<AppBarStateFailure>());
      expect((states[1] as AppBarStateFailure).message, 'error');
      expect(states.length, 2);
    });
  });
}
