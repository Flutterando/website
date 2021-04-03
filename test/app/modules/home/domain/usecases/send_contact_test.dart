import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/domain/repositories/send_contact_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:mocktail/mocktail.dart';

class SendContactRepositoryMock extends Mock implements SendContactRepository {}

main() {
  final repository = SendContactRepositoryMock();
  final usecase = SendContactImpl(repository);
  test('Should return a success message', () async {
    final contact = Contact(
      email: 'emailTest@gmail.com',
      message: 'messageTest',
      name: 'nameTest',
    );
    final resultContact = ResultContact(
      'Succesfull Test!',
    );
    when(() => repository.send(contact))
        .thenAnswer((_) async => Right(resultContact));
    final result = await usecase(contact);
    expect(result.fold(id, id), isA<ResultContact>());
  });

  test('Should return a InvalidContactError in case of invalid contact',
      () async {
    final contact = Contact(
      email: '',
      name: '',
      message: 'test without name and email fields',
    );
    final result = await usecase(contact);
    expect(result.fold(id, id), isA<InvalidContactError>());
  });
}
