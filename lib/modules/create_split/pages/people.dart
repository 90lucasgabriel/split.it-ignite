import 'package:flutter/material.dart';
import 'package:splitit/widgets/person_tile/person_tile.dart';

import 'package:splitit/widgets/step_text_field.dart';
import 'package:splitit/widgets/step_title.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({
    Key? key,
    // required this.onChanged,
  }) : super(key: key);

  // final void Function(String value) onChanged;

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepTitle(title: 'Com quem', subtitle: 'você quer dividir?'),
        const SizedBox(height: 40),
        StepTextField(hintText: 'Nome da pessoa', onChanged: (value) {}),
        const SizedBox(height: 40),
        const PersonTile(name: 'Person name', isSelected: true),
        const PersonTile(name: 'Person name 2', isSelected: false),
        const PersonTile(name: 'Person name 3', isSelected: false),
      ],
    );
  }
}
