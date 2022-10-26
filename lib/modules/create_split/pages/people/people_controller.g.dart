// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PeopleController on _PeopleControllerBase, Store {
  Computed<List<FriendModel>>? _$friendListComputed;

  @override
  List<FriendModel> get friendList => (_$friendListComputed ??=
          Computed<List<FriendModel>>(() => super.friendList,
              name: '_PeopleControllerBase.friendList'))
      .value;

  final _$_friendListOriginalAtom =
      Atom(name: '_PeopleControllerBase._friendListOriginal');

  @override
  List<FriendModel> get _friendListOriginal {
    _$_friendListOriginalAtom.reportRead();
    return super._friendListOriginal;
  }

  @override
  set _friendListOriginal(List<FriendModel> value) {
    _$_friendListOriginalAtom.reportWrite(value, super._friendListOriginal, () {
      super._friendListOriginal = value;
    });
  }

  final _$selectedFriendListAtom =
      Atom(name: '_PeopleControllerBase.selectedFriendList');

  @override
  ObservableList<FriendModel> get selectedFriendList {
    _$selectedFriendListAtom.reportRead();
    return super.selectedFriendList;
  }

  @override
  set selectedFriendList(ObservableList<FriendModel> value) {
    _$selectedFriendListAtom.reportWrite(value, super.selectedFriendList, () {
      super.selectedFriendList = value;
    });
  }

  final _$searchAtom = Atom(name: '_PeopleControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$getFriendListAsyncAction =
      AsyncAction('_PeopleControllerBase.getFriendList');

  @override
  Future<void> getFriendList() {
    return _$getFriendListAsyncAction.run(() => super.getFriendList());
  }

  final _$_PeopleControllerBaseActionController =
      ActionController(name: '_PeopleControllerBase');

  @override
  void onChange(String value) {
    final _$actionInfo = _$_PeopleControllerBaseActionController.startAction(
        name: '_PeopleControllerBase.onChange');
    try {
      return super.onChange(value);
    } finally {
      _$_PeopleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFriend(FriendModel friend) {
    final _$actionInfo = _$_PeopleControllerBaseActionController.startAction(
        name: '_PeopleControllerBase.addFriend');
    try {
      return super.addFriend(friend);
    } finally {
      _$_PeopleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFriend(FriendModel friend) {
    final _$actionInfo = _$_PeopleControllerBaseActionController.startAction(
        name: '_PeopleControllerBase.removeFriend');
    try {
      return super.removeFriend(friend);
    } finally {
      _$_PeopleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedFriendList: ${selectedFriendList},
search: ${search},
friendList: ${friendList}
    ''';
  }
}
