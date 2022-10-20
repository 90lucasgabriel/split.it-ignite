import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';
import 'package:splitit/modules/create_split/pages/items/items_controller.dart';
import 'package:splitit/modules/create_split/widgets/item_add_button/item_add_button.dart';
import 'package:splitit/modules/create_split/widgets/item_input/item_input.dart';
import 'package:splitit/shared/models/item_model.dart';
import 'package:splitit/widgets/step_title.dart';

class ItemsPage extends StatefulWidget {
  final CreateSplitController controller;

  const ItemsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final itemsController = ItemsController();

  @override
  void initState() {
    autorun((_) {
      widget.controller.onChanged(items: itemsController.itemList.toList());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StepTitle(title: 'Quais itens', subtitle: 'você quer dividir?'),
        const SizedBox(height: 40),
        Observer(
          builder: (_) => ItemInput(
            key: UniqueKey(),
            name: (value) {
              itemsController.onChanged(name: value);
            },
            price: (value) {
              itemsController.onChanged(price: value);
            },
          ),
        ),
        Observer(
          builder: (_) => itemsController.enabledAddButton
              ? ItemAddButton(
                  label: 'Adicionar',
                  onPressed: () {
                    itemsController.addItem();
                  },
                )
              : const SizedBox(
                  height: 48,
                ),
        ),
        const SizedBox(
          height: 16,
        ),
        Observer(
          builder: (_) => Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: itemsController.itemList
                    .asMap()
                    .entries
                    .map(
                      (item) => Column(
                        children: [
                          ItemInput(
                            key: Key([item.key].hashCode.toString()),
                            index: item.key,
                            initialValues: ItemModel(
                              name: itemsController.itemList[item.key].name,
                              price: itemsController.itemList[item.key].price,
                            ),
                            name: (value) {
                              itemsController.updateItem(item.key, name: value);
                            },
                            price: (value) {
                              itemsController.updateItem(item.key,
                                  price: value);
                            },
                            showRemove: true,
                            onRemove: () {
                              itemsController.removeItem(item.key);
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
