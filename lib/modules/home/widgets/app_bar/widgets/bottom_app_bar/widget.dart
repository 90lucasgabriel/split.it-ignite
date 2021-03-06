import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:splitit/modules/home/widgets/app_bar/controller.dart';
import 'package:splitit/modules/home/widgets/app_bar/state.dart';
import 'package:splitit/modules/home/widgets/app_bar/widgets/bottom_app_bar/loading.dart';
import 'package:splitit/modules/home/widgets/info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      switch (controller.state.runtimeType) {
        case AppBarStateLoading:
          {
            return const BottomAppBarLoading();
          }
        case AppBarStateSuccess:
          {
            final dashboard =
                (controller.state as AppBarStateSuccess).dashboard;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCardWidget(
                  value: dashboard.positive,
                  isLoading: false,
                ),
                const SizedBox(width: 24),
                InfoCardWidget(
                  value: dashboard.negative,
                  isLoading: false,
                ),
              ],
            );
          }
        case AppBarStateFailure:
          {
            final message = (controller.state as AppBarStateFailure).message;
            return Text(message);
          }
        default:
          {
            Container();
          }
      }

      return Container();
    });
  }
}
