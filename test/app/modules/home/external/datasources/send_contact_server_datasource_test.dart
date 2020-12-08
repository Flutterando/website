import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/external/datasources/send_contact_server_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = SendContactServerDatasource(dio);
  test('Should return a ResultContact', () async {
    when(dio.post(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => Response(data: {}, statusCode: 201));
    final future = datasource.sendContact(ContactModel());
    expect(future, completes);
  });

  test('Should return a error if statusCode isn\'t 201', () async {
    when(dio.post(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = datasource.sendContact(ContactModel());
    expect(future, throwsA(isA<SendContactExternalError>()));
  });
}
