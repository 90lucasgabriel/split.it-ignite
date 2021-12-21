import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class StepTitle extends StatelessWidget {
  const StepTitle({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppTheme.textStyles.eventTitle,
        children: [
          TextSpan(
            text: '\n$subtitle',
            style: AppTheme.textStyles.eventSubtitle,
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
