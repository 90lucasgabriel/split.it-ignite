import 'package:flutter/material.dart';

import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/modules/home/widgets/app_bar_widget.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/widgets/event_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    final List<EventModel> eventList = [
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: -85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: 143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
      EventModel(
        title: 'Churrasco',
        createdAt: DateTime.now(),
        value: -143.71,
        people: 4,
      ),
      EventModel(
        title: 'Pizza',
        createdAt: DateTime.now(),
        value: 85.90,
        people: 3,
      ),
    ];

    return Scaffold(
      appBar: AppBarWidget(user: user, onTapAddButton: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...eventList
                .map(
                  (event) => EventTileWidget(
                    model: event,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
