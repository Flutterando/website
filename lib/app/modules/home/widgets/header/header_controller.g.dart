// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HeaderController = BindInject(
  (i) => HeaderController(i<ScreenSize>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeaderController on _HeaderControllerBase, Store {
  final _$followersAtom = Atom(name: '_HeaderControllerBase.followers');

  @override
  String? get followers {
    _$followersAtom.reportRead();
    return super.followers;
  }

  @override
  set followers(String? value) {
    _$followersAtom.reportWrite(value, super.followers, () {
      super.followers = value;
    });
  }

  final _$instaFollowersAsyncAction =
      AsyncAction('_HeaderControllerBase.instaFollowers');

  @override
  Future<void> instaFollowers() {
    return _$instaFollowersAsyncAction.run(() => super.instaFollowers());
  }

  @override
  String toString() {
    return '''
followers: ${followers}
    ''';
  }
}
