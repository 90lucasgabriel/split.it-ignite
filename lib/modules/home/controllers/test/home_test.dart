import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import 'package:splitit/modules/home/controllers/home.dart';
import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/state/home.dart';
import 'package:splitit/shared/models/event.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  group('Home Screen', () {
    late HomeController controller;
    late HomeRepository repository;

    setUp(() {
      repository = HomeRepositoryMock();
      controller = HomeController(
        repository: repository,
      );
    });

    test('It should getEventList success.', () async {
      // Arrange
      final states = <HomeState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(repository.getEventList).thenAnswer((_) async => [
            EventModel(
                title: 'title',
                createdAt: DateTime.now(),
                value: 100,
                people: 2)
          ]);

      await controller.getEventList();

      // Assert
      expect(states[0], isInstanceOf<HomeStateEmpty>());
      expect(states[1], isInstanceOf<HomeStateLoading>());
      expect(states[2], isInstanceOf<HomeStateSuccess>());
      expect(states.length, 3);
    });

    test('It should getEventList error.', () async {
      // Arrange
      final states = <HomeState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });

      // Act
      when(repository.getEventList).thenThrow('error');
      await controller.getEventList();

      // Assert
      expect(states[0], isInstanceOf<HomeStateEmpty>());
      expect(states[1], isInstanceOf<HomeStateFailure>());
      expect((states[1] as HomeStateFailure).message, 'error');
      expect(states.length, 2);
    });
  });
}
