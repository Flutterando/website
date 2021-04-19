// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brazilian_cases_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BrazilianCasesController = BindInject(
  (i) => BrazilianCasesController(
      i<ScreenSize>(), i<GetBrazilianCases>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrazilianCasesController on _BrazilianCasesControllerBase, Store {
  final _$brazilianCasesAtom =
      Atom(name: '_BrazilianCasesControllerBase.brazilianCases');

  @override
  ObservableList<ResultBrazilianCases> get brazilianCases {
    _$brazilianCasesAtom.reportRead();
    return super.brazilianCases;
  }

  @override
  set brazilianCases(ObservableList<ResultBrazilianCases> value) {
    _$brazilianCasesAtom.reportWrite(value, super.brazilianCases, () {
      super.brazilianCases = value;
    });
  }

  final _$errorAtom = Atom(name: '_BrazilianCasesControllerBase.error');

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

  final _$fetchBrazilianCasesAsyncAction =
      AsyncAction('_BrazilianCasesControllerBase.fetchBrazilianCases');

  @override
  Future fetchBrazilianCases() {
    return _$fetchBrazilianCasesAsyncAction
        .run(() => super.fetchBrazilianCases());
  }

  @override
  String toString() {
    return '''
brazilianCases: ${brazilianCases},
error: ${error}
    ''';
  }
}
