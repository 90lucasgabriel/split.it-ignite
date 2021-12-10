import 'package:flutter/material.dart';
import 'package:splitit/modules/home/controllers/home.dart';
import 'package:splitit/modules/home/state/home.dart';

import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/modules/home/widgets/app_bar/widget.dart';
import 'package:splitit/widgets/event_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEventList(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBarWidget(user: user, onTapAddButton: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (controller.state is HomeStateLoading)
              const CircularProgressIndicator(),
            if (controller.state is HomeStateSuccess)
              ...(controller.state as HomeStateSuccess)
                  .eventList
                  .map(
                    (event) => EventTileWidget(
                      model: event,
                    ),
                  )
                  .toList(),
            if (controller.state is HomeStateFailure)
              Text((controller.state as HomeStateFailure).message),
          ],
        ),
      ),
    );
  }
}
