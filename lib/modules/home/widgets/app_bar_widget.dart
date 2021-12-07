import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/info_card_widget.dart';

import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/modules/home/widgets/add_button_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;

  AppBarWidget({
    Key? key,
    required this.user,
    required this.onTapAddButton,
  }) : super(
          preferredSize: const Size.fromHeight(318),
          child: Stack(
            children: [
              Container(
                color: AppTheme.colors.background2,
                height: 220,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                height: 318,
                child: SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 62,
                                  width: 62,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(user.photoUrl!),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Flexible(
                                  child: Text(
                                    user.name!,
                                    style: AppTheme.textStyles.appBarTitle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AddButtonWidget(
                            onTap: onTapAddButton,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          InfoCardWidget(
                            value: 124,
                          ),
                          SizedBox(width: 24),
                          InfoCardWidget(value: -235),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}
