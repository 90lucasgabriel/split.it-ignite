import 'package:flutter/material.dart';
import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';

import 'package:splitit/widgets/step_text_field.dart';
import 'package:splitit/widgets/step_title.dart';

class EventPage extends StatefulWidget {
  final CreateSplitController controller;

  const EventPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const StepTitle(title: 'Qual o nome', subtitle: 'do evento?'),
      const SizedBox(height: 40),
      StepTextField(
        hintText: 'Ex: Churrasco',
        onChanged: (value) {
          widget.controller.onChanged(title: value);
        },
      ),
    ]);
  }
}
