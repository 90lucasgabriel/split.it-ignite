import 'package:flutter/material.dart';
import 'package:splitit/modules/home/controllers/home.dart';
import 'package:splitit/modules/home/state/home.dart';

import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/modules/home/widgets/app_bar/widget.dart';
import 'package:splitit/widgets/event_tile/event_tile.dart';
import 'package:splitit/widgets/event_tile/event_tile_loading.dart';

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
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, '/create_split');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (controller.state is HomeStateLoading)
              ...List.generate(4, (index) => const EventTileLoading()),
            if (controller.state is HomeStateSuccess)
              ...(controller.state as HomeStateSuccess)
                  .eventList
                  .map(
                    (event) => EventTileWidget(
                      model: event,
                      isLoading: false,
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
