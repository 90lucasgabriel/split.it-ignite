import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';

import 'package:splitit/theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onBackPressed;
  final CreateSplitController controller;
  final int totalPages;

  CreateSplitAppBar({
    required this.onBackPressed,
    required this.controller,
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
                  child: Observer(builder: (context) {
                    return Text.rich(
                      TextSpan(
                        text: '${controller.currentPage + 1}',
                        style: AppTheme.textStyles.appBarCurrentPage,
                        children: [
                          TextSpan(
                            text: ' - $totalPages',
                            style: AppTheme.textStyles.appBarTotalPages,
                          )
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
}
