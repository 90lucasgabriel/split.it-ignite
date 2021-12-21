import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/step_text_field.dart';
import 'package:splitit/widgets/step_title.dart';

class EventPage extends StatefulWidget {
  const EventPage({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String value) onChanged;

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const StepTitle(title: 'Qual o nome', subtitle: 'do evento?'),
      const SizedBox(height: 40),
      StepTextField(hintText: 'Ex: Churrasco', onChanged: widget.onChanged),
    ]);
  }
}
