import 'package:splitit/modules/home/models/dashboard.dart';
import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

class HomeRepositoryFirebase implements HomeRepository {
  final firebase = FirebaseRepository();

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
    try {
      final response = await firebase.get('/events');
      final eventList = response.map((e) => EventModel.fromMap(e)).toList();

      return eventList;
    } catch (e) {
      return [];
    }
  }
}
