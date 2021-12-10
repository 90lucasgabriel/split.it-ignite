import 'package:splitit/shared/models/event.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final List<EventModel> eventList;

  HomeStateSuccess({
    required this.eventList,
  });
}

class HomeStateFailure extends HomeState {
  final String message;

  HomeStateFailure({
    required this.message,
  });
}
