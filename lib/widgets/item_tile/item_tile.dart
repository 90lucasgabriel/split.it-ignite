import 'package:flutter/material.dart';
import 'package:splitit/shared/models/item_model.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(item.name),
      trailing: Text(item.price.toBrl()),
    );
  }
}
