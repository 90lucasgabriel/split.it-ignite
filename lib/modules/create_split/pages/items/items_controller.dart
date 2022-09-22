import 'package:mobx/mobx.dart';

import 'package:splitit/shared/models/item_model.dart';

part 'items_controller.g.dart';

class ItemsController = _ItemsControllerBase with _$ItemsController;

abstract class _ItemsControllerBase with Store {
  @observable
  ObservableList<ItemModel> itemList = ObservableList<ItemModel>.of([]);

  @observable
  ItemModel item = ItemModel();

  @computed
  bool get enabledAddButton => item.name.isNotEmpty && item.price != 0;

  @computed
  int get length => itemList.length;

  @action
  void addItem() {
    itemList.add(item);
    item = ItemModel();
  }

  @action
  void removeItem(int index) {
    itemList.removeAt(index);
  }

  @action
  void onChanged({String? name, double? price}) {
    item = item.copyWith(name: name, price: price);
  }

  @action
  void updateItem(int index, {String? name, double? price}) {
    itemList[index] = itemList[index].copyWith(name: name, price: price);
  }
}
