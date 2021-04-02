
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/external/datasources/send_contact_server_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}
class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final dio = DioMock();
  late RequestOptionsMock _requestOptionsMock;
  final envsVar = {"title":"production", "urlSendContact":"flutterand_test@flutterando.com.br"};
  final datasource = SendContactServerDatasource(dio, envsVar);
  
  setUpAll(() {
    _requestOptionsMock = RequestOptionsMock();
  });

  test('Should return a ResultContact', () async {
    var contact = ContactModel(name: "Flutterando", message:"Hi!", email: "flutterando@flutterando.com.br");
    when(() => dio.get(any(), queryParameters: contact.toMap()))
        .thenAnswer((_) async => Response(data: {}, statusCode: 200, requestOptions: _requestOptionsMock));
    
    final future = await datasource.sendContact(contact);
    expect(future, isA<ResultContact>());
  });

  test('Should return a error if statusCode isn\'t 200', () async {
    var contact = ContactModel(name: "Flutterando", message:"Hi!", email: "flutterando@flutterando.com.br");
    when(() => dio.get(any(), queryParameters: contact.toMap())).thenThrow(DioError(
      requestOptions: _requestOptionsMock,
      response: Response(
        statusCode: 401,
        data: {'message': 'Request Error'}, requestOptions: _requestOptionsMock,
      ),
    ));
    
    final future = datasource.sendContact(contact);
    expect(future, throwsA(isA<SendContactExternalError>()));
  });
}
