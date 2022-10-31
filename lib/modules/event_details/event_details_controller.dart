import 'package:mobx/mobx.dart';
import 'package:splitit/modules/event_details/state/event_details.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
part 'event_details_controller.g.dart';

class EventDetailsController = _EventDetailsControllerBase
    with _$EventDetailsController;

abstract class _EventDetailsControllerBase with Store {
  final FirebaseRepository firebaseRepository;

  _EventDetailsControllerBase({required this.firebaseRepository});

  @observable
  EventDetailsState state = EventDetailsStateEmpty();

  @action
  void update(EventDetailsState state) {
    this.state = state;
  }

  Future<void> delete(String id) async {
    try {
      update(EventDetailsStateLoading());

      await firebaseRepository.delete(id: id, collection: '/events');

      update(EventDetailsStateSuccess());
    } catch (error) {
      update(
          EventDetailsStateError(message: 'Não foi possível apagar evento.'));
    }
  }
}
