// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brazilian_cases_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrazilianCasesController on _BrazilianCasesControllerBase, Store {
  late final _$brazilianCasesAtom = Atom(
      name: '_BrazilianCasesControllerBase.brazilianCases', context: context);

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

  late final _$errorAtom =
      Atom(name: '_BrazilianCasesControllerBase.error', context: context);

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

  late final _$fetchBrazilianCasesAsyncAction = AsyncAction(
      '_BrazilianCasesControllerBase.fetchBrazilianCases',
      context: context);

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
