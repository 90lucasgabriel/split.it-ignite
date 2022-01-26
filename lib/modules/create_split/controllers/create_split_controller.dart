import 'package:mobx/mobx.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  String eventName = '';

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

  @computed
  bool get enabledNavigateButton {
    return eventName.isNotEmpty;
  }
}
