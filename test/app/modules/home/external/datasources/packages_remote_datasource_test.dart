import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/external/datasources/packages_remote_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_packages_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/packages_data_mock.dart';

class DioSpy extends Mock implements Dio {}
class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final dio = DioSpy();
  final datasource = PackagesRemoteDatasource(dio);
  final _requestOptionsMock = RequestOptionsMock();
  test('Should return a list of ResultPackagesModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(data: packagesDataMock, requestOptions: _requestOptionsMock, statusCode: 200));
    final result = await datasource.getPackages();
    expect(result, isA<List<ResultPackagesModel>>());
  });
}
