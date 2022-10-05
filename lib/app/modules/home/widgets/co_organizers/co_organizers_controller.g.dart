// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'co_organizers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoOrganizersController on _CoOrganizersControllerBase, Store {
  late final _$coOrganizersAtom =
      Atom(name: '_CoOrganizersControllerBase.coOrganizers', context: context);

  @override
  ObservableList<ResultCoOrganizers> get coOrganizers {
    _$coOrganizersAtom.reportRead();
    return super.coOrganizers;
  }

  @override
  set coOrganizers(ObservableList<ResultCoOrganizers> value) {
    _$coOrganizersAtom.reportWrite(value, super.coOrganizers, () {
      super.coOrganizers = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_CoOrganizersControllerBase.error', context: context);

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

  late final _$fetchPartnersAsyncAction = AsyncAction(
      '_CoOrganizersControllerBase.fetchPartners',
      context: context);

  @override
  Future fetchPartners() {
    return _$fetchPartnersAsyncAction.run(() => super.fetchPartners());
  }

  @override
  String toString() {
    return '''
coOrganizers: ${coOrganizers},
error: ${error}
    ''';
  }
}
