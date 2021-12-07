import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

enum IconCardType { positive, negative }

class IconCardWidget extends StatelessWidget {
  final IconCardType type;

  const IconCardWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  String get imagePath =>
      'assets/images/money-${type == IconCardType.positive ? 'positive' : 'negative'}.png';
  Color get background => type == IconCardType.positive
      ? AppTheme.colors.primaryBackground
      : AppTheme.colors.errorBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: background,
      ),
      child: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
