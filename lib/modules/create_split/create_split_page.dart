import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitit/modules/create_split/pages/items.dart';

import 'package:splitit/theme/app_theme.dart';

import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';
import 'package:splitit/modules/create_split/pages/event.dart';
import 'package:splitit/modules/create_split/pages/people.dart';
import 'package:splitit/modules/create_split/widgets/app_bar/app_bar.dart';
import 'package:splitit/modules/create_split/widgets/bottom_step_bar/bottom_step_bar.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  State<CreateSplitPage> createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pageList;

  @override
  void initState() {
    pageList = [
      EventPage(controller: controller),
      const PeoplePage(),
      const ItemsPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primaryBackground,
      appBar: CreateSplitAppBar(
        onBackPressed: () {
          Navigator.pop(context);
        },
        controller: controller,
        totalPages: pageList.length,
      ),
      body: Center(
        child: Observer(builder: (context) {
          return pageList[controller.currentPage];
        }),
      ),
      bottomNavigationBar: CreateSplitBottomStepBar(
        controller: controller,
        previousOnPressed: () {
          controller.previousPage();
        },
        nextOnPressed: () {
          controller.nextPage();
        },
      ),
    );
  }
}
