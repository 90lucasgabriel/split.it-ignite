import 'package:mobx/mobx.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/widgets/check_button/check_button.dart';
import 'package:splitit/widgets/check_button/enum/state.dart';
part 'controller.g.dart';

class CheckButtonController = _CheckButtonControllerBase
    with _$CheckButtonController;

abstract class _CheckButtonControllerBase with Store {
  final FirebaseRepository firebaseRepository;
  final EventModel event;
  var isPaid = false;

  _CheckButtonControllerBase({
    required this.firebaseRepository,
    required this.event,
  });

  @observable
  CheckButtonState state = CheckButtonState.empty;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      state = CheckButtonState.loading;
      final friends = event.friends;
      final indexWhere =
          event.friends.indexWhere((element) => element == friend);
      isPaid = !friends[indexWhere].isPaid;
      friends[indexWhere] = friends[indexWhere].copyWith(isPaid: isPaid);

      final newPaid =
          event.value + (isPaid ? -event.valueSplitted : event.valueSplitted);
      final parsedEvent = event.copyWith(friends: friends, valuePaid: newPaid);

      await firebaseRepository.update(
          id: event.id, collection: '/events', model: parsedEvent);

      if (isPaid) {
        state = CheckButtonState.success;
      } else {
        state = CheckButtonState.empty;
      }
    } catch (error) {
      state = CheckButtonState.error;
    }
  }
}
