import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onBackPressed;
  final int currentPage;
  final int totalPages;

  CreateSplitAppBar({
    required this.onBackPressed,
    required this.currentPage,
    required this.totalPages,
    Key? key,
  }) : super(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            top: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onBackPressed,
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.colors.gray,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text.rich(
                    TextSpan(
                      text: '${currentPage + 1}',
                      style: AppTheme.textStyles.appBarCurrentPage,
                      children: [
                        TextSpan(
                          text: ' - $totalPages',
                          style: AppTheme.textStyles.appBarTotalPages,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
