import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/external/datasources/co_organizers_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/co_organizers_data_mock.dart';

class DioSpy extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final dio = DioSpy();
  final requestOptions = RequestOptionsMock();
  final datasource = CoOrganizersRemoteDatasource(dio);
  test('Should return a list of ResultCoOrganizersModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(data: coOrganizersDataMock, requestOptions: requestOptions, statusCode: 200));
    final result = await datasource.getCoOrganizers();
    expect(result, isA<List<ResultCoOrganizers>>());
  });
}
