import 'package:flutter/material.dart';
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
  var currentPage = 0;

  @override
  void initState() {
    pageList = [
      EventPage(
        onChanged: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      PeoplePage(),
      ItemsPage(),
    ];

    super.initState();
  }

  void nextPage() {
    if (currentPage == pageList.length - 1) {
      return;
    }

    currentPage++;
    setState(() {});
  }

  void previousPage() {
    if (currentPage == 0) {
      return;
    }

    currentPage--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primaryBackground,
      appBar: CreateSplitAppBar(
        onBackPressed: () {
          Navigator.pop(context);
        },
        currentPage: currentPage,
        totalPages: pageList.length,
      ),
      body: Center(
        child: pageList[currentPage],
      ),
      bottomNavigationBar: CreateSplitBottomStepBar(
        enabledButtons: controller.enabledNavigateButton(),
        previousOnPressed: () {
          previousPage();
        },
        nextOnPressed: () {
          nextPage();
        },
      ),
    );
  }
}
