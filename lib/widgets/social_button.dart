import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class SocialButtonWidget extends StatefulWidget {
  final String imagePath;
  final String label;

  const SocialButtonWidget({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  _SocialButtonWidgetState createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.fromBorderSide(
          BorderSide(width: 1, color: AppTheme.colors.grayLight),
        ),
      ),
      height: 56,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              widget.imagePath,
              width: 24,
              height: 24,
            ),
          ),
          Container(
            width: 1,
            color: AppTheme.colors.grayLight,
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.label,
                style: AppTheme.textStyles.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}