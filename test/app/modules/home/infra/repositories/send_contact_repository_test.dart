import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/infra/datasources/send_contact_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/send_contact_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class SendContactDatasourceMock extends Mock implements SendContactDatasource {}

class ContactModelFake extends Fake implements ContactModel {}

main() {
  final contact = Contact(
    email: 'emailTest@gmail.com',
    message: 'messageTest',
    name: 'nameTest',
  );

  setUpAll(() {
    registerFallbackValue(ContactModelFake());
  });

  final datasource = SendContactDatasourceMock();
  final repository = SendContactRepositoryImpl(datasource);
  test('Should return a ResultContact succesfull', () async {
    when(() => datasource.sendContact(any()))
        .thenAnswer((_) async => ResultContact("Succesfull Test!"));
    final result = await repository.send(contact);
    expect(result.fold(id, id), isA<ResultContact>());
  });

  test('Should return a SendContactExternalError when datasource fail',
      () async {
    when(() => datasource.sendContact(any())).thenThrow(Exception());
    final result = await repository.send(contact);
    expect(result.fold(id, id), isA<SendContactExternalError>());
  });
}
