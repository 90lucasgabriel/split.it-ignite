import 'package:flutter/material.dart';

import 'package:splitit/modules/home/widgets/app_bar/controller.dart';
import 'package:splitit/modules/home/widgets/app_bar/state.dart';
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
    controller.getDashboard(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return const CircularProgressIndicator();
        }
      case AppBarStateSuccess:
        {
          final dashboard = (controller.state as AppBarStateSuccess).dashboard;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoCardWidget(
                value: dashboard.positive,
              ),
              const SizedBox(width: 24),
              InfoCardWidget(
                value: -dashboard.negative,
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
  }
}
