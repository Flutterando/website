// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FooterController on _FooterControllerBase, Store {
  late final _$resultContactAtom =
      Atom(name: '_FooterControllerBase.resultContact', context: context);

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

  late final _$messageErrorAtom =
      Atom(name: '_FooterControllerBase.messageError', context: context);

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

  late final _$loadingSendContactAtom =
      Atom(name: '_FooterControllerBase.loadingSendContact', context: context);

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

  late final _$sendContactAsyncAction =
      AsyncAction('_FooterControllerBase.sendContact', context: context);

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
