import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:splitit/modules/home/repositories/home.dart';
import 'package:splitit/modules/home/repositories/home_mock.dart';
import 'package:splitit/modules/home/state/home.dart';

part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository repository;

  _HomeControllerBase({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  @observable
  HomeState state = HomeStateEmpty();

  @action
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
