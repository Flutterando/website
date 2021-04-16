// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PackagesController = BindInject(
  (i) =>
      PackagesController(i<ScreenSize>(), i<GetPackages>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PackagesController on _PackagesControllerBase, Store {
  final _$packagesAtom = Atom(name: '_PackagesControllerBase.packages');

  @override
  ObservableList<ResultPackage> get packages {
    _$packagesAtom.reportRead();
    return super.packages;
  }

  @override
  set packages(ObservableList<ResultPackage> value) {
    _$packagesAtom.reportWrite(value, super.packages, () {
      super.packages = value;
    });
  }

  final _$errorAtom = Atom(name: '_PackagesControllerBase.error');

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

  final _$fetchPackagesAsyncAction =
      AsyncAction('_PackagesControllerBase.fetchPackages');

  @override
  Future fetchPackages() {
    return _$fetchPackagesAsyncAction.run(() => super.fetchPackages());
  }

  @override
  String toString() {
    return '''
packages: ${packages},
error: ${error}
    ''';
  }
}
