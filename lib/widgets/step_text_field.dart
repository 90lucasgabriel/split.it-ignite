import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class StepTextField extends StatelessWidget {
  const StepTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.textAlign = TextAlign.center,
    this.padding,
  }) : super(key: key);

  final void Function(String) onChanged;
  final String hintText;
  final TextAlign textAlign;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 48),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppTheme.colors.primary,
        textAlign: textAlign,
        style: TextStyle(color: AppTheme.colors.grayDark),
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}
