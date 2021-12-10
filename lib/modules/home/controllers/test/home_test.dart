import 'package:flutter_test/flutter_test.dart';
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
      when(repository.getEventList).thenAnswer((_) async => [
            EventModel(
                title: 'title',
                createdAt: DateTime.now(),
                value: 100,
                people: 2)
          ]);

      // Act
      await controller.getEventList(() {});

      // Assert
      expect(controller.state, isInstanceOf<HomeStateSuccess>());
    });

    test('It should getEventList error.', () async {
      // Arrange
      when(repository.getEventList).thenThrow('error');

      // Act
      await controller.getEventList(() {});

      // Assert
      expect(controller.state, isInstanceOf<HomeStateFailure>());
      expect((controller.state as HomeStateFailure).message, 'error');
    });
  });
}
