import 'package:splitit/modules/home/models/dashboard.dart';
import 'package:splitit/shared/models/event.dart';

abstract class HomeRepository {
  Future<List<EventModel>> getEventList();
  Future<HomeDashboardModel> getDashboard();
}
