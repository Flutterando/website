import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/data/co_organizers_data.dart';
import 'package:flutterando/app/modules/home/external/datasources/co_organizers_local_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_co_organizers_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/co_organizers_data_mock.dart';

class CoOrganizersDataMock extends Mock implements CoOrganizersData {}

main() {
  final coOrganizers = CoOrganizersDataMock();
  final datasource = CoOrganizersLocalDatasource(coOrganizers);
  test('Should return a list of ResultCoOrganizersModel', () {
    when(() => coOrganizers.get()).thenAnswer((_) => coOrganizersDataMock);
    final result = datasource.getCoOrganizers();
    expect(result, isA<List<ResultCoOrganizersModel>>());
  });
}
