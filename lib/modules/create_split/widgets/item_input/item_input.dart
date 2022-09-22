import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:splitit/shared/models/item_model.dart';

import 'package:splitit/widgets/step_text_field.dart';

class ItemInput extends StatefulWidget {
  final ValueChanged<String> name;
  final ValueChanged<double> price;
  final int? index;
  final ItemModel? initialValues;
  final bool showRemove;
  final VoidCallback? onRemove;

  const ItemInput({
    Key? key,
    required this.name,
    required this.price,
    this.index,
    this.initialValues,
    this.showRemove = false,
    this.onRemove,
  }) : super(key: key);

  @override
  State<ItemInput> createState() => _ItemInputState();
}

class _ItemInputState extends State<ItemInput> {
  late MoneyMaskedTextController moneyController;

  @override
  void initState() {
    moneyController = MoneyMaskedTextController(
        initialValue: widget.initialValues?.price ?? 0,
        leftSymbol: 'R\$ ',
        decimalSeparator: ',');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              if (widget.index != null)
                Expanded(
                  child: Text('${widget.index! + 1}'),
                ),
              Expanded(
                flex: 7,
                child: StepTextField(
                  hintText: 'Nome do item',
                  initialValue: widget.initialValues?.name,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.zero,
                  onChanged: (value) {
                    widget.name(value);
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: StepTextField(
                  controller: moneyController,
                  hintText: 'R\$ 0,00',
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  padding: EdgeInsets.zero,
                  onChanged: (value) {
                    widget.price(moneyController.numberValue);
                  },
                ),
              ),
              widget.showRemove
                  ? IconButton(
                      onPressed: () {
                        if (widget.onRemove != null) {
                          return widget.onRemove!();
                        }
                      },
                      icon: const Icon(Icons.delete_outline),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
