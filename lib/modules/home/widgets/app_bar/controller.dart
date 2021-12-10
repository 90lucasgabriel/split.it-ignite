import 'package:flutter/material.dart';

import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/repositories/home_mock.dart';
import 'package:splitit/modules/home/widgets/app_bar/state.dart';

class AppBarController {
  late HomeRepository homeRepository;

  AppBarState state = AppBarStateEmpty();

  AppBarController({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  getDashboard(VoidCallback callback) async {
    try {
      state = AppBarStateLoading();

      final response = await homeRepository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
    } catch (error) {
      state = AppBarStateFailure(message: error.toString());
    } finally {
      callback();
    }
  }
}
