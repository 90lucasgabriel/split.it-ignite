import 'package:mobx/mobx.dart';

import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/models/item_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  final FirebaseRepository firebaseRepository;
  _CreateSplitControllerBase({
    required this.firebaseRepository,
  });

  @observable
  int currentPage = 0;

  @observable
  EventModel event = EventModel(
    title: '',
    createdAt: DateTime.now(),
    value: 0,
  );

  @observable
  String status = 'empty';

  @action
  Future<void> saveEvent() async {
    try {
      status = 'loading';
      final response = await firebaseRepository.create(event);
      print(response);
      status = 'success';
      nextPage();
    } catch (e) {
      status = 'error';
    }
  }

  @action
  void nextPage() {
    if (currentPage >= 3) {
      return;
    }

    currentPage++;
  }

  @action
  void previousPage() {
    if (currentPage == 0) {
      return;
    }

    currentPage--;
  }

  @action
  void onChanged(
      {String? title, List<ItemModel>? items, List<FriendModel>? friends}) {
    event = event.copyWith(title: title, items: items, friends: friends);
  }

  @computed
  bool get enabledNavigateButton {
    final step1 = event.title.isNotEmpty && currentPage == 0;
    final step2 = event.friends.isNotEmpty && currentPage == 1;
    final step3 = event.items.isNotEmpty && currentPage == 2;

    return step1 || step2 || step3;
  }
}
