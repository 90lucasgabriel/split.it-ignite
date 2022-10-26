import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';
import 'package:splitit/modules/create_split/pages/people/people_controller.dart';
import 'package:splitit/widgets/person_tile/person_tile.dart';
import 'package:splitit/widgets/step_text_field.dart';
import 'package:splitit/widgets/step_title.dart';

class PeoplePage extends StatefulWidget {
  final CreateSplitController controller;

  const PeoplePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  late PeopleController controller;

  @override
  void initState() {
    controller = PeopleController(controller: widget.controller);
    controller.getFriendList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepTitle(title: 'Com quem', subtitle: 'você quer dividir?'),
        const SizedBox(height: 40),
        StepTextField(
          hintText: 'Nome da pessoa',
          onChanged: (value) {
            controller.onChange(value);
          },
        ),
        const SizedBox(height: 40),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(builder: (context) {
                  if (controller.selectedFriendList.isNotEmpty) {
                    return Column(children: [
                      ...controller.selectedFriendList
                          .map(
                            (friend) => PersonTile(
                              data: friend,
                              isSelected: true,
                              onPressed: () {
                                controller.removeFriend(friend);
                              },
                            ),
                          )
                          .toList(),
                      const SizedBox(height: 40),
                    ]);
                  }

                  return Container();
                }),
                Observer(builder: (context) {
                  if (controller.friendList.isNotEmpty) {
                    return Column(
                      children: controller.friendList
                          .map(
                            (friend) => PersonTile(
                              data: friend,
                              isSelected: false,
                              onPressed: () {
                                controller.addFriend(friend);
                              },
                            ),
                          )
                          .toList(),
                    );
                  }

                  return const Text('Nenhum amigo encontrado.');
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
