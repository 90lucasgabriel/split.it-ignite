// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppBarController on _AppBarControllerBase, Store {
  late final _$stateAtom =
      Atom(name: '_AppBarControllerBase.state', context: context);

  @override
  AppBarState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppBarState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getDashboardAsyncAction =
      AsyncAction('_AppBarControllerBase.getDashboard', context: context);

  @override
  Future getDashboard() {
    return _$getDashboardAsyncAction.run(() => super.getDashboard());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
