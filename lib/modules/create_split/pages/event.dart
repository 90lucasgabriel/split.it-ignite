import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:splitit/theme/app_theme.dart';

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
      Text.rich(
        TextSpan(
          text: 'Qual o nome',
          style: AppTheme.textStyles.eventTitle,
          children: [
            TextSpan(
              text: '\ndo evento?',
              style: AppTheme.textStyles.eventSubtitle,
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 40,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: TextField(
          onChanged: widget.onChanged,
          cursorColor: AppTheme.colors.primary,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppTheme.colors.grayDark),
          decoration: InputDecoration(
            hintText: 'Ex: Churrasco',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.grayLight),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.colors.primary,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
