import 'package:splitit/modules/home/models/dashboard.dart';
import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/shared/models/event.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<HomeDashboardModel> getDashboard() async {
    await Future.delayed(const Duration(seconds: 2));

    return HomeDashboardModel(
      positive: 142.67,
      negative: -76.23,
    );
  }

  @override
  Future<List<EventModel>> getEventList() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: -85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: -143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
    ];
  }
}
