// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_meetups_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LatestMeetupsController on _LatestMeetupsControllerBase, Store {
  late final _$meetupsAtom =
      Atom(name: '_LatestMeetupsControllerBase.meetups', context: context);

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

  late final _$errorAtom =
      Atom(name: '_LatestMeetupsControllerBase.error', context: context);

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

  late final _$fetchMeetupsAsyncAction = AsyncAction(
      '_LatestMeetupsControllerBase.fetchMeetups',
      context: context);

  @override
  Future fetchMeetups() {
    return _$fetchMeetupsAsyncAction.run(() => super.fetchMeetups());
  }

  @override
  String toString() {
    return '''
meetups: ${meetups},
error: ${error}
    ''';
  }
}
