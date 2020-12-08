import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_co_organizers_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/co_organizers_repository_impl.dart';
import 'package:mockito/mockito.dart';

class CoOrganizersDatasourceMock extends Mock
    implements CoOrganizersDatasource {}

main() {
  final datasource = CoOrganizersDatasourceMock();
  final repository = CoOrganizersRepositoryImpl(datasource);
  test('Should return a list of ResultCoOrganizers', () {
    when(datasource.getCoOrganizers())
        .thenAnswer((_) => <ResultCoOrganizersModel>[]);
    final result = repository.get();

    expect(result | null, isA<List<ResultCoOrganizers>>());
  });

  test('Should return a DatasourceError when datasource fail', () {
    when(datasource.getCoOrganizers()).thenThrow(Exception());
    final result = repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
