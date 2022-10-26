// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_split_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateSplitController on _CreateSplitControllerBase, Store {
  Computed<bool>? _$enabledNavigateButtonComputed;

  @override
  bool get enabledNavigateButton => (_$enabledNavigateButtonComputed ??=
          Computed<bool>(() => super.enabledNavigateButton,
              name: '_CreateSplitControllerBase.enabledNavigateButton'))
      .value;

  late final _$currentPageAtom =
      Atom(name: '_CreateSplitControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$eventAtom =
      Atom(name: '_CreateSplitControllerBase.event', context: context);

  @override
  EventModel get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(EventModel value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_CreateSplitControllerBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$saveEventAsyncAction =
      AsyncAction('_CreateSplitControllerBase.saveEvent', context: context);

  @override
  Future<void> saveEvent() {
    return _$saveEventAsyncAction.run(() => super.saveEvent());
  }

  late final _$_CreateSplitControllerBaseActionController =
      ActionController(name: '_CreateSplitControllerBase', context: context);

  @override
  void nextPage() {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged(
      {String? title, List<ItemModel>? items, List<FriendModel>? friends}) {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.onChanged');
    try {
      return super.onChanged(title: title, items: items, friends: friends);
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
event: ${event},
status: ${status},
enabledNavigateButton: ${enabledNavigateButton}
    ''';
  }
}
