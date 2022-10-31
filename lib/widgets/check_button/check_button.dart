import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class CheckButton extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const CheckButton(
      {Key? key, required this.isSelected, required this.onPressed})
      : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  Color get primaryColor => widget.isSelected
      ? AppTheme.colors.primaryBackground
      : AppTheme.colors.grayLight.withOpacity(0.1);
  Color get secondaryColor =>
      widget.isSelected ? AppTheme.colors.primary : AppTheme.colors.grayLight;
  IconData get icon =>
      widget.isSelected ? Icons.check_box : Icons.check_box_outline_blank;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(4)),
        child: Icon(
          icon,
          color: secondaryColor,
        ),
      ),
    );
  }
}
