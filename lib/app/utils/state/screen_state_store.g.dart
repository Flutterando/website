// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScreenStateStore on _ScreenStateStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_ScreenStateStoreBase.state', context: context);

  @override
  ScreenState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ScreenState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
