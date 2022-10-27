import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/create_split/pages/items/items_page.dart';
import 'package:splitit/modules/create_split/pages/success/success_page.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';

import 'package:splitit/modules/create_split/enum/status_enum.dart';
export 'package:splitit/modules/create_split/enum/status_enum.dart';

import 'package:splitit/theme/app_theme.dart';

import 'package:splitit/modules/create_split/controllers/create_split_controller.dart';
import 'package:splitit/modules/create_split/pages/event.dart';
import 'package:splitit/modules/create_split/pages/people/people_page.dart';
import 'package:splitit/modules/create_split/widgets/app_bar/app_bar.dart';
import 'package:splitit/modules/create_split/widgets/bottom_step_bar/bottom_step_bar.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  State<CreateSplitPage> createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller =
      CreateSplitController(firebaseRepository: FirebaseRepository());

  late List<Widget> pageList;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    pageList = [
      EventPage(controller: controller),
      PeoplePage(controller: controller),
      ItemsPage(controller: controller),
    ];

    _disposer = autorun((_) {
      if (controller.status == StatusEnum.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) => SuccessPage(controller: controller))));
        return;
      }

      if (controller.status == StatusEnum.error) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não foi possível criar o evento.');
        return;
      }

      if (controller.status == StatusEnum.loading) {
        BotToast.showLoading();
        return;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool backNavigate() {
    if (controller.currentPage > 0) {
      controller.previousPage();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backNavigate(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.primaryBackground,
        appBar: CreateSplitAppBar(
          onBackPressed: () {
            if (backNavigate()) {
              Navigator.pop(context);
            }
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
            backNavigate();
          },
        ),
      ),
    );
  }
}
