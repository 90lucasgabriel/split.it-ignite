import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:splitit/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get text;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.primary,
      );

  @override
  TextStyle get text => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.gray,
      );
}
