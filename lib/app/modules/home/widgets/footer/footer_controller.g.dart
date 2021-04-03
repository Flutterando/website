// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $FooterController = BindInject(
  (i) => FooterController(i<ScreenSize>(), i<SendContact>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FooterController on _FooterControllerBase, Store {
  final _$resultContactAtom = Atom(name: '_FooterControllerBase.resultContact');

  @override
  ResultContact get resultContact {
    _$resultContactAtom.reportRead();
    return super.resultContact;
  }

  @override
  set resultContact(ResultContact value) {
    _$resultContactAtom.reportWrite(value, super.resultContact, () {
      super.resultContact = value;
    });
  }

  final _$messageErrorAtom = Atom(name: '_FooterControllerBase.messageError');

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  final _$loadingSendContactAtom =
      Atom(name: '_FooterControllerBase.loadingSendContact');

  @override
  bool get loadingSendContact {
    _$loadingSendContactAtom.reportRead();
    return super.loadingSendContact;
  }

  @override
  set loadingSendContact(bool value) {
    _$loadingSendContactAtom.reportWrite(value, super.loadingSendContact, () {
      super.loadingSendContact = value;
    });
  }

  final _$sendContactAsyncAction =
      AsyncAction('_FooterControllerBase.sendContact');

  @override
  Future sendContact(Contact contact) {
    return _$sendContactAsyncAction.run(() => super.sendContact(contact));
  }

  @override
  String toString() {
    return '''
resultContact: ${resultContact},
messageError: ${messageError},
loadingSendContact: ${loadingSendContact}
    ''';
  }
}
