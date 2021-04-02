import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/brazilian_cases_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class BrazilianCasesDatasourceMock extends Mock
    implements BrazilianCasesDatasource {}

main() {
  final datasource = BrazilianCasesDatasourceMock();
  final repository = BrazilianCasesRepositoryImpl(datasource);
  test('Should return a list of ResultBrazilianCases', () {
    when(() => datasource.getBrazilianCases())
        .thenAnswer((_) => <ResultBrazilianCasesModel>[]);
    final result = repository.get();

    expect(result.fold(id, id), isA<List<ResultBrazilianCases>>());
  });

  test('Should return a DatasourceError when datasource fail', () {
    when(() => datasource.getBrazilianCases()).thenThrow(Exception());
    final result = repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
