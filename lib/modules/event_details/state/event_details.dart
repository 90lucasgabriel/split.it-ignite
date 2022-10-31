abstract class EventDetailsState {}

class EventDetailsStateEmpty extends EventDetailsState {}

class EventDetailsStateLoading extends EventDetailsState {}

class EventDetailsStateSuccess extends EventDetailsState {}

class EventDetailsStateError extends EventDetailsState {
  final String message;

  EventDetailsStateError({required this.message});
}
