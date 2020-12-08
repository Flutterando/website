// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partners_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PartnersController = BindInject(
  (i) => PartnersController(i<ScreenSize>(), i<GetPartners>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartnersController on _PartnersControllerBase, Store {
  final _$partnersAtom = Atom(name: '_PartnersControllerBase.partners');

  @override
  ObservableList<ResultPartners> get partners {
    _$partnersAtom.reportRead();
    return super.partners;
  }

  @override
  set partners(ObservableList<ResultPartners> value) {
    _$partnersAtom.reportWrite(value, super.partners, () {
      super.partners = value;
    });
  }

  final _$errorAtom = Atom(name: '_PartnersControllerBase.error');

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

  final _$_PartnersControllerBaseActionController =
      ActionController(name: '_PartnersControllerBase');

  @override
  dynamic fetchPartners() {
    final _$actionInfo = _$_PartnersControllerBaseActionController.startAction(
        name: '_PartnersControllerBase.fetchPartners');
    try {
      return super.fetchPartners();
    } finally {
      _$_PartnersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
partners: ${partners},
error: ${error}
    ''';
  }
}
