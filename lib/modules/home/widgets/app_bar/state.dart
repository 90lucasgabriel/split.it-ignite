import 'package:splitit/modules/home/models/dashboard.dart';

abstract class AppBarState {}

class AppBarStateEmpty extends AppBarState {}

class AppBarStateLoading extends AppBarState {}

class AppBarStateSuccess extends AppBarState {
  final HomeDashboardModel dashboard;

  AppBarStateSuccess({
    required this.dashboard,
  });
}

class AppBarStateFailure extends AppBarState {
  final String message;

  AppBarStateFailure({
    required this.message,
  });
}
