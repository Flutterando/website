import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/packages_datasource.dart';
import 'package:flutterando/app/modules/home/infra/repositories/packages_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class PackagesDatasourceMock extends Mock implements PackagesDatasource {}

main() {
  final datasource = PackagesDatasourceMock();
  final repository = PackagesRepositoryImpl(datasource);
  test('Should return a list of ResultPackages', () async {
    when(() => datasource.getPackages()).thenAnswer((_) async => <ResultPackage>[]);
    final result = await repository.get();
    expect(result.fold(id, id), isA<List<ResultPackage>>());
  });

  test('Should return a DatasourceError when datasource fail', () async {
    when(() => datasource.getPackages()).thenThrow(Exception());
    final result = await repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
