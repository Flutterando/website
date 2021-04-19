import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/external/datasources/partners_remote_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/partners_data_mock.dart';

class DioSpy extends Mock implements Dio {}
class RequestOptionsMock extends Mock implements RequestOptions {}
main() {
  final dio = DioSpy();
  final datasource = PartnersRemoteDatasource(dio);
  final _requestOptionsMock = RequestOptionsMock();

  test('Should return a list of ResultPartnersModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(data: partnersDataMock, requestOptions: _requestOptionsMock, statusCode: 200));
    final result = await datasource.getPartners();
    expect(result, isA<List<ResultPartnersModel>>());
  });
}
