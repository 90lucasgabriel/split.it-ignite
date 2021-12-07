import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get primaryLight;
  Color get primaryBackground;
  Color get gray;
  Color get grayLight;
  Color get grayDark;
  Color get white;
  Color get error;
  Color get errorBackground;
  Color get background;
  Color get background2;
}

class AppColorsDefault implements AppColors {
  @override
  Color get primary => const Color(0xFF40B38C);

  @override
  Color get primaryLight => const Color(0xFF40B28C);

  @override
  Color get primaryBackground => const Color(0xFFE9F8F2);

  @override
  Color get gray => const Color(0xFF666666);

  @override
  Color get grayLight => const Color(0xFFA4B2AE);

  @override
  Color get grayDark => const Color(0xFF455250);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFE83F5B);

  @override
  Color get errorBackground => const Color(0xFFFDECEF);

  @override
  Color get background => const Color(0xFF40B38C);

  @override
  Color get background2 => const Color(0xFF45CC93);
}
