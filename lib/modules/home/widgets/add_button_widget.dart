import 'package:flutter/material.dart';
import 'package:splitit/theme/app_theme.dart';

class AddButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const AddButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppTheme.colors.white,
              width: 1,
            ),
          ),
        ),
        height: 48,
        width: 48,
        child: Icon(
          Icons.add,
          color: AppTheme.colors.white,
        ),
      ),
    );
  }
}
