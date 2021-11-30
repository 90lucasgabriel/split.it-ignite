import 'dart:math';
import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

abstract class AppGradients {
  Gradient get background;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => LinearGradient(
        colors: [
          AppTheme.colors.background,
          AppTheme.colors.background2,
        ],
        stops: const [0.0, 0.7],
        transform: const GradientRotation(2.3 * pi),
      );
}
