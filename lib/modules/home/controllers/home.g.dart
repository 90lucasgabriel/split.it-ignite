// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$stateAtom =
      Atom(name: '_HomeControllerBase.state', context: context);

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getEventListAsyncAction =
      AsyncAction('_HomeControllerBase.getEventList', context: context);

  @override
  Future<void> getEventList() {
    return _$getEventListAsyncAction.run(() => super.getEventList());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
