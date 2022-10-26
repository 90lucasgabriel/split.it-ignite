import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';

class SuccessPage extends StatelessWidget {
  final CreateSplitController controller;
  const SuccessPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0, 1],
              transform: GradientRotation(2.35),
              colors: [Color(0xFF40B38C), Color(0xFF45CC93)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/money.png', width: 240, height: 240),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              '${controller.event.friends.length} pessoas',
              style: AppTheme.textStyles.itemAddButton
                  .copyWith(color: AppTheme.colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'R\$ ${controller.event.valueSplitted.toStringAsFixed(2)}',
              style: AppTheme.textStyles.title
                  .copyWith(color: AppTheme.colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'para cada um',
              style: AppTheme.textStyles.itemAddButton
                  .copyWith(color: AppTheme.colors.white),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.event.friends
                  .map((e) => Container(
                        margin: const EdgeInsets.all(4),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(e.photoURL),
                                fit: BoxFit.cover)),
                      ))
                  .toList(),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    stops: [0, 1],
                    transform: GradientRotation(2.35),
                    colors: [Color(0xFF40B38C), Color(0xFF45CC93)])),
            height: 76,
            child: Center(
              child: Text('OKAY :D',
                  style: AppTheme.textStyles.itemAddButton
                      .copyWith(color: AppTheme.colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
