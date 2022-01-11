import 'package:mobx/mobx.dart';

import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/repositories/home_mock.dart';
import 'package:splitit/modules/home/widgets/app_bar/state.dart';

part 'controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  late HomeRepository homeRepository;

  _AppBarControllerBase({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  @observable
  AppBarState state = AppBarStateEmpty();

  @action
  getDashboard() async {
    try {
      state = AppBarStateLoading();

      final response = await homeRepository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
    } catch (error) {
      state = AppBarStateFailure(message: error.toString());
    }
  }
}
