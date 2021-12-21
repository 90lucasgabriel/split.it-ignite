import 'package:flutter/material.dart';
import 'package:splitit/widgets/step_text_field.dart';
import 'package:splitit/widgets/step_title.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StepTitle(title: 'Quais itens', subtitle: 'você quer dividir?'),
        const SizedBox(height: 40),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: Text('1'),
              ),
              Expanded(
                flex: 3,
                child: StepTextField(
                  hintText: 'Picanha',
                  onChanged: (value) {},
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                flex: 2,
                child: StepTextField(
                  hintText: 'R\$ 0,00',
                  onChanged: (value) {},
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
