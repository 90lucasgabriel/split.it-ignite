import 'package:flutter/material.dart';

import 'package:splitit/modules/create_split/widgets/button_step/button_step.dart';
import 'package:splitit/theme/app_theme.dart';

class CreateSplitBottomStepBar extends StatelessWidget {
  const CreateSplitBottomStepBar({
    Key? key,
    required this.previousOnPressed,
    required this.nextOnPressed,
    this.enabledButtons = false,
  }) : super(key: key);

  final VoidCallback? previousOnPressed;
  final VoidCallback? nextOnPressed;
  final bool enabledButtons;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
          color: AppTheme.colors.primaryBackground,
          height: 72,
          child: Row(
            children: [
              ButtonStep(
                label: 'Cancelar',
                disabled: enabledButtons,
                onPressed: previousOnPressed,
              ),
              Container(
                height: 72,
                width: 1,
                color: AppTheme.colors.grayLight,
              ),
              ButtonStep(
                label: 'Continuar',
                disabled: enabledButtons,
                onPressed: nextOnPressed,
              ),
            ],
          )),
    );
  }
}
