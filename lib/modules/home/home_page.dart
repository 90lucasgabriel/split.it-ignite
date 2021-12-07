import 'package:flutter/material.dart';

import 'package:splitit/modules/login/models/user_model.dart';
import 'package:splitit/modules/home/widgets/app_bar_widget.dart';

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

    return Scaffold(
      appBar: AppBarWidget(user: user, onTapAddButton: () {}),
    );
  }
}
