// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventDetailsController on _EventDetailsControllerBase, Store {
  late final _$stateAtom =
      Atom(name: '_EventDetailsControllerBase.state', context: context);

  @override
  EventDetailsState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(EventDetailsState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_EventDetailsControllerBaseActionController =
      ActionController(name: '_EventDetailsControllerBase', context: context);

  @override
  void update(EventDetailsState state) {
    final _$actionInfo = _$_EventDetailsControllerBaseActionController
        .startAction(name: '_EventDetailsControllerBase.update');
    try {
      return super.update(state);
    } finally {
      _$_EventDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
