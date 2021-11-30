import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
  Color get background2;
}

class AppColorsDefault implements AppColors {
  @override
  Color get background => const Color(0xFF40B38C);

  @override
  Color get background2 => const Color(0xFF45CC93);
}
