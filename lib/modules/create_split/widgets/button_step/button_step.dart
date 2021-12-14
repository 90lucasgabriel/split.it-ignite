import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class ButtonStep extends StatelessWidget {
  const ButtonStep({
    Key? key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: disabled ? onPressed : null,
        child: Text(
          label,
          style: disabled
              ? AppTheme.textStyles.textDisabled
              : AppTheme.textStyles.text,
        ),
      ),
    );
  }
}
