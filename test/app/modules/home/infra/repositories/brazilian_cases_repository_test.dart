import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';
import 'package:flutterando/app/modules/home/infra/repositories/brazilian_cases_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class BrazilianCasesDatasourceMock extends Mock implements BrazilianCasesDatasource {}

main() {
  final datasource = BrazilianCasesDatasourceMock();
  final repository = BrazilianCasesRepositoryImpl(datasource);
  test('Should return a list of ResultBrazilianCases', () async {
    when(() => datasource.getBrazilianCases()).thenAnswer((_) async => <ResultBrazilianCases>[]);
    final result = await repository.get();

    expect(result.fold(id, id), isA<List<ResultBrazilianCases>>());
  });

  test('Should return a DatasourceError when datasource fail', () async {
    when(() => datasource.getBrazilianCases()).thenThrow(Exception());
    final result = await repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
