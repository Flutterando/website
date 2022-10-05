// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'founders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoundersController on _FoundersControllerBase, Store {
  late final _$foundersAtom =
      Atom(name: '_FoundersControllerBase.founders', context: context);

  @override
  ObservableList<ResultFounders> get founders {
    _$foundersAtom.reportRead();
    return super.founders;
  }

  @override
  set founders(ObservableList<ResultFounders> value) {
    _$foundersAtom.reportWrite(value, super.founders, () {
      super.founders = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_FoundersControllerBase.error', context: context);

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

  late final _$fetchPartnersAsyncAction =
      AsyncAction('_FoundersControllerBase.fetchPartners', context: context);

  @override
  Future fetchPartners() {
    return _$fetchPartnersAsyncAction.run(() => super.fetchPartners());
  }

  @override
  String toString() {
    return '''
founders: ${founders},
error: ${error}
    ''';
  }
}
