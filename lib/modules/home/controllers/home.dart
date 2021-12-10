import 'package:flutter/material.dart';

import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/repositories/home_mock.dart';
import 'package:splitit/modules/home/state/home.dart';

class HomeController {
  late HomeRepository repository;

  HomeState state = HomeStateEmpty();

  HomeController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  Future<void> getEventList(VoidCallback callback) async {
    try {
      state = HomeStateLoading();

      final response = await repository.getEventList();
      state = HomeStateSuccess(eventList: response);
    } catch (error) {
      state = HomeStateFailure(message: error.toString());
    } finally {
      callback();
    }
  }
}
