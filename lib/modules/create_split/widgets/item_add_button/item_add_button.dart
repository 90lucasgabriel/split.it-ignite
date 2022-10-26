import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class ItemAddButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ItemAddButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        color: AppTheme.colors.primary,
        size: 16,
      ),
      label: Text(
        label,
        style: AppTheme.textStyles.itemAddButton,
      ),
    );
  }
}
