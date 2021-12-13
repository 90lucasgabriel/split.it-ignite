import 'package:flutter/material.dart';
import 'package:splitit/modules/home/widgets/info_card_widget.dart';

class BottomAppBarLoading extends StatelessWidget {
  const BottomAppBarLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        InfoCardWidget(
          value: 0,
          isLoading: true,
        ),
        SizedBox(width: 24),
        InfoCardWidget(
          value: 0,
          isLoading: true,
        ),
      ],
    );
  }
}
