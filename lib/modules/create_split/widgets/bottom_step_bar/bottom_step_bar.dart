import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';

import 'package:splitit/modules/create_split/widgets/button_step/button_step.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitBottomStepBar extends StatelessWidget {
  final VoidCallback? previousOnPressed;
  final CreateSplitController controller;

  const CreateSplitBottomStepBar({
    Key? key,
    required this.previousOnPressed,
    required this.controller,
  }) : super(key: key);

  void onNextPressed() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
      return;
    }

    controller.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
          color: AppTheme.colors.primaryBackground,
          height: 73,
          child: Observer(
              builder: (context) => Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: controller.enabledNavigateButton
                            ? AppTheme.colors.gray
                            : AppTheme.colors.grayLight,
                      ),
                      Row(
                        children: [
                          ButtonStep(
                            label: 'Cancelar',
                            disabled: controller.enabledNavigateButton,
                            onPressed: previousOnPressed,
                          ),
                          Container(
                            height: 72,
                            width: 1,
                            color: controller.enabledNavigateButton
                                ? AppTheme.colors.gray
                                : AppTheme.colors.grayLight,
                          ),
                          ButtonStep(
                            label: controller.currentPage == 2
                                ? 'Finalizar'
                                : 'Continuar',
                            disabled: controller.enabledNavigateButton,
                            onPressed: onNextPressed,
                          )
                        ],
                      ),
                    ],
                  ))),
    );
  }
}
