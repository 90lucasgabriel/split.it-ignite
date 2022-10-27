import 'package:mobx/mobx.dart';

import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

part 'people_controller.g.dart';

class PeopleController = _PeopleControllerBase with _$PeopleController;

abstract class _PeopleControllerBase with Store {
  final repository = FirebaseRepository();
  final CreateSplitController controller;
  late ReactionDisposer _disposer;

  _PeopleControllerBase({
    required this.controller,
  }) {
    _disposer = autorun((_) {
      controller.onChanged(friends: selectedFriendList);
    });
  }

  void dispose() {
    _disposer();
  }

  @observable
  List<FriendModel> _friendListOriginal = [];

  @observable
  ObservableList<FriendModel> selectedFriendList = ObservableList.of([]);

  @observable
  String search = '';

  @computed
  List<FriendModel> get friendList {
    if (search.isNotEmpty || selectedFriendList.isNotEmpty) {
      final filteredFriendList = _friendListOriginal
          .where((friend) =>
              friend.name
                  .toString()
                  .toLowerCase()
                  .contains(search.toLowerCase()) &&
              !selectedFriendList.contains(friend))
          .toList();

      return filteredFriendList;
    }

    return _friendListOriginal;
  }

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  Future<void> getFriendList() async {
    final response = await repository.get('/friends');

    _friendListOriginal =
        response.map((friend) => FriendModel.fromMap(friend)).toList();
  }

  @action
  void addFriend(FriendModel friend) {
    selectedFriendList.add(friend);
  }

  @action
  void removeFriend(FriendModel friend) {
    selectedFriendList.remove(friend);
  }
}
