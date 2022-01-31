import 'package:mobx/mobx.dart';
import 'package:splitit/shared/models/friend_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  String eventName = '';

  @observable
  List<FriendModel> selectedFriendList = <FriendModel>[];

  @action
  void nextPage() {
    if (currentPage >= 2) {
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
  void setEventName(String value) {
    eventName = value;
  }

  @action
  void setSelectedFriendList(List<FriendModel> value) {
    selectedFriendList = value;
  }

  @computed
  bool get enabledNavigateButton {
    final step1 = eventName.isNotEmpty && currentPage == 0;
    final step2 = selectedFriendList.isNotEmpty && currentPage == 1;

    return step1 || step2;
  }
}
