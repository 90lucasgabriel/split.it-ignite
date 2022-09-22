// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemsController on _ItemsControllerBase, Store {
  Computed<bool>? _$enabledAddButtonComputed;

  @override
  bool get enabledAddButton => (_$enabledAddButtonComputed ??= Computed<bool>(
          () => super.enabledAddButton,
          name: '_ItemsControllerBase.enabledAddButton'))
      .value;
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??= Computed<int>(() => super.length,
          name: '_ItemsControllerBase.length'))
      .value;

  final _$itemListAtom = Atom(name: '_ItemsControllerBase.itemList');

  @override
  ObservableList<ItemModel> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(ObservableList<ItemModel> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  final _$itemAtom = Atom(name: '_ItemsControllerBase.item');

  @override
  ItemModel get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(ItemModel value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$_ItemsControllerBaseActionController =
      ActionController(name: '_ItemsControllerBase');

  @override
  void addItem() {
    final _$actionInfo = _$_ItemsControllerBaseActionController.startAction(
        name: '_ItemsControllerBase.addItem');
    try {
      return super.addItem();
    } finally {
      _$_ItemsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$_ItemsControllerBaseActionController.startAction(
        name: '_ItemsControllerBase.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_ItemsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged({String? name, double? price}) {
    final _$actionInfo = _$_ItemsControllerBaseActionController.startAction(
        name: '_ItemsControllerBase.onChanged');
    try {
      return super.onChanged(name: name, price: price);
    } finally {
      _$_ItemsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateItem(int index, {String? name, double? price}) {
    final _$actionInfo = _$_ItemsControllerBaseActionController.startAction(
        name: '_ItemsControllerBase.updateItem');
    try {
      return super.updateItem(index, name: name, price: price);
    } finally {
      _$_ItemsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList},
item: ${item},
enabledAddButton: ${enabledAddButton},
length: ${length}
    ''';
  }
}
