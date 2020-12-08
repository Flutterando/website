import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/data/partners_data.dart';
import 'package:flutterando/app/modules/home/external/datasources/partners_local_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/partners_data_mock.dart';

class PartnersDataMock extends Mock implements PartnersData {}

main() {
  final partners = PartnersDataMock();
  final datasource = PartnersLocalDatasource(partners);
  test('Should return a list of ResultPartnersModel', () {
    when(partners.get()).thenAnswer((_) => imagesPathMock);
    final result = datasource.getPartners();
    expect(result, isA<List<ResultPartnersModel>>());
  });
}
