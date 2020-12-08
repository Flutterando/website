import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/data/brazilian_cases_data.dart';
import 'package:flutterando/app/modules/home/external/datasources/brazilian_cases_local_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/brazilian_cases_data_mock.dart';

class BrazilianCasesDataMock extends Mock implements BrazilianCasesData {}

main() {
  final brazilianCases = BrazilianCasesDataMock();
  final datasource = BrazilianCasesLocalDatasource(brazilianCases);
  test('Should return a list of ResultCoOrganizersModel', () {
    when(brazilianCases.get()).thenAnswer((_) => brazilianCasesDataMock);
    final result = datasource.getBrazilianCases();
    expect(result, isA<List<ResultBrazilianCasesModel>>());
  });
}
