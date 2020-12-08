import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/partners_repository_impl.dart';
import 'package:mockito/mockito.dart';

class PartnersDatasourceMock extends Mock implements PartnersDatasource {}

main() {
  final datasource = PartnersDatasourceMock();
  final repository = PartnersRepositoryImpl(datasource);
  test('Should return a list of ResultPartners', () {
    when(datasource.getPartners()).thenAnswer((_) => <ResultPartnersModel>[]);
    final result = repository.get();

    expect(result | null, isA<List<ResultPartners>>());
  });

  test('Should return a DatasourceError when datasource fail', () {
    when(datasource.getPartners()).thenThrow(Exception());
    final result = repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
