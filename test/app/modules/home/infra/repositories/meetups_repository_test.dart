import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/meetups_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MeetupsDatasourceMock extends Mock implements MeetupsDatasource {}

main() {
  final datasource = MeetupsDatasourceMock();
  final repository = MeetupsRepositoryImpl(datasource);
  test('Should return a list of ResultMeetups', () async {
    when(() => datasource.getMeetups()).thenAnswer(
      (_) async => <ResultMeetupsModel>[],
    );
    final result = await repository.get();

    expect(result.fold(id, id), isA<List<ResultMeetups>>());
  });

  test('Should return a DatasourceError when datasource fail', () async {
    when(() => datasource.getMeetups()).thenThrow(Exception());
    final result = await repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
