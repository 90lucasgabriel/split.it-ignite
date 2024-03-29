import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitit/modules/create_split/widgets/item_add_button/item_add_button.dart';

import 'package:splitit/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get text;
  TextStyle get textDisabled;
  TextStyle get appBarTitle;

  TextStyle get positivePrice;
  TextStyle get positivePriceTitle;
  TextStyle get negativePrice;
  TextStyle get negativePriceTitle;

  TextStyle get eventTileTitle;
  TextStyle get eventTileSubtitle;
  TextStyle get eventTileValue;
  TextStyle get eventTilePeople;

  TextStyle get appBarCurrentPage;
  TextStyle get appBarTotalPages;

  TextStyle get eventTitle;
  TextStyle get eventSubtitle;

  TextStyle get itemAddButton;
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
  TextStyle get textDisabled => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.grayLight,
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

  @override
  TextStyle get eventTileTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.grayDark,
      );

  @override
  TextStyle get eventTileSubtitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.grayDark,
      );

  @override
  TextStyle get eventTileValue => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.gray,
      );

  @override
  TextStyle get eventTilePeople => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.grayLight,
      );

  @override
  TextStyle get appBarCurrentPage => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.primary,
      );

  @override
  TextStyle get appBarTotalPages => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.grayLight,
      );

  @override
  TextStyle get eventTitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.grayDark,
      );

  @override
  TextStyle get eventSubtitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.grayDark,
      );

  @override
  TextStyle get itemAddButton => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.primary,
      );
}
