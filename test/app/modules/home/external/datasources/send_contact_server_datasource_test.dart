import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/external/datasources/send_contact_server_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mocktail/mocktail.dart';

class HasuraConnectSpy extends Mock implements HasuraConnect {}

main() {
  final connection = HasuraConnectSpy();

  final datasource = SendContactServerDatasource(connection);

  test('Should return a ResultContact', () async {
    var contact = ContactModel(
        name: "Flutterando",
        message: "Hi!",
        email: "flutterando@flutterando.com.br");
    when(() => connection.mutation(any(), variables: any(named: 'variables')))
        .thenAnswer((invocation) async => {
              "data": {
                "insert_mail_box": {"affected_rows": 1}
              }
            });

    final future = await datasource.sendContact(contact);
    expect(future, isA<ResultContact>());
  });

  test('Should return a error if send email fails', () async {
    var contact = ContactModel(
        name: "Flutterando",
        message: "Hi!",
        email: "flutterando@flutterando.com.br");
    when(() => connection.mutation(any(), variables: any(named: 'variables')))
        .thenThrow(
            SendContactExternalError(message: "Eror ao enviar o Email!"));
    final future = datasource.sendContact(contact);
    expect(future, throwsA(isA<SendContactExternalError>()));
  });
}
