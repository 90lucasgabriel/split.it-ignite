import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';

class SocialButtonWidget extends StatefulWidget {
  final String imagePath;
  final String label;
  final bool isLoading;
  final VoidCallback onTap;

  const SocialButtonWidget({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.isLoading,
    required this.onTap,
  }) : super(key: key);

  @override
  _SocialButtonWidgetState createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
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
                child: widget.isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppTheme.colors.grayLight,
                        ),
                      )
                    : Text(
                        widget.label,
                        style: AppTheme.textStyles.text,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
