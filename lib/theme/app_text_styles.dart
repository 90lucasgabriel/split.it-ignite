import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:splitit/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get text;
  TextStyle get appBarTitle;
  TextStyle get positivePrice;
  TextStyle get positivePriceTitle;
  TextStyle get negativePrice;
  TextStyle get negativePriceTitle;
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

  @override
  TextStyle get appBarTitle => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.white,
      );

  @override
  TextStyle get positivePrice => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.primary,
      );

  @override
  TextStyle get negativePrice => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.error,
      );

  @override
  TextStyle get positivePriceTitle => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.primary,
      );

  @override
  TextStyle get negativePriceTitle => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.error,
      );
}
