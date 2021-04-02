import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/data/packages_data.dart';
import 'package:flutterando/app/modules/home/external/datasources/packages_local_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_packages_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/packages_data_mock.dart';

class PackagesDataMock extends Mock implements PackagesData {}

main() {
  final packages = PackagesDataMock();
  final datasource = PackagesLocalDatasource(packages);
  test('Should return a list of ResultPackagesModel', () {
    when(() => packages.get()).thenAnswer((_) => packagesDataMock);
    final result = datasource.getPackages();
    expect(result, isA<List<ResultPackagesModel>>());
  });
}
