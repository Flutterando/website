// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_meetups_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LatestMeetupsController = BindInject(
  (i) => LatestMeetupsController(
      i<ScreenSize>(), i<GetMeetups>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LatestMeetupsController on _LatestMeetupsControllerBase, Store {
  final _$meetupsAtom = Atom(name: '_LatestMeetupsControllerBase.meetups');

  @override
  ObservableList<ResultMeetups> get meetups {
    _$meetupsAtom.reportRead();
    return super.meetups;
  }

  @override
  set meetups(ObservableList<ResultMeetups> value) {
    _$meetupsAtom.reportWrite(value, super.meetups, () {
      super.meetups = value;
    });
  }

  final _$errorAtom = Atom(name: '_LatestMeetupsControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_LatestMeetupsControllerBaseActionController =
      ActionController(name: '_LatestMeetupsControllerBase');

  @override
  dynamic fetchMeetups() {
    final _$actionInfo = _$_LatestMeetupsControllerBaseActionController
        .startAction(name: '_LatestMeetupsControllerBase.fetchMeetups');
    try {
      return super.fetchMeetups();
    } finally {
      _$_LatestMeetupsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
meetups: ${meetups},
error: ${error}
    ''';
  }
}
