import 'package:flutter/material.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/widgets/skeleton.dart';

import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/icon_card_widget.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;

  const InfoCardWidget({
    Key? key,
    required this.value,
    required this.isLoading,
  }) : super(key: key);

  TextStyle get valueTextStyle => value >= 0
      ? AppTheme.textStyles.positivePriceTitle
      : AppTheme.textStyles.negativePriceTitle;

  IconCardType get iconCardType =>
      value >= 0 ? IconCardType.positive : IconCardType.negative;

  String get description => value >= 0 ? 'a receber' : 'a pagar';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppTheme.colors.grayLight,
            ),
          ),
        ),
        height: 168,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconCardWidget(
              type: iconCardType,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: AppTheme.textStyles.text),
                const SizedBox(height: 4),
                if (isLoading) ...[
                  const Skeleton(
                    size: Size(94, 24),
                  ),
                ] else ...[
                  Text(value.toBrl(), style: valueTextStyle)
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
