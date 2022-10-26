import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class StepTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final TextAlign textAlign;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? initialValue;

  const StepTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.textAlign = TextAlign.center,
    this.padding,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 48),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: AppTheme.colors.primary,
        textAlign: textAlign,
        initialValue: initialValue,
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
