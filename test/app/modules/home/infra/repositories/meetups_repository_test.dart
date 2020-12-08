import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/meetups_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MeetupsDatasourceMock extends Mock implements MeetupsDatasource {}

main() {
  final datasource = MeetupsDatasourceMock();
  final repository = MeetupsRepositoryImpl(datasource);
  test('Should return a list of ResultMeetups', () {
    when(datasource.getMeetups()).thenAnswer(
      (_) => <ResultMeetupsModel>[],
    );
    final result = repository.get();

    expect(result | null, isA<List<ResultMeetups>>());
  });

  test('Should return a DatasourceError when datasource fail', () {
    when(datasource.getMeetups()).thenThrow(Exception());
    final result = repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
