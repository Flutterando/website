import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/external/datasources/brazilian_cases_remote_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/brazilian_cases_data_mock.dart';

class DioSpy extends Mock implements Dio {}
class RequestOptionsMock extends Mock implements RequestOptions {}
main() {
  // final brazilianCases = BrazilianCasesDataMock();
  final dio = DioSpy();
  final requestOptions = RequestOptionsMock();
  final datasource = BrazilianCasesRemoteDatasource(dio);
  test('Should return a list of ResultCoOrganizersModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(data: brazilianCasesDataMock, requestOptions: requestOptions, statusCode: 200));
    final result = await datasource.getBrazilianCases();
    expect(result, isA<List<ResultBrazilianCasesModel>>());
  });
}
