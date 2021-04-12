import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/meetups_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_meetups.dart';
import 'package:mocktail/mocktail.dart';

class GetMeetupsRepositoryMock extends Mock implements MeetupsRepository {}

main() {
  final repository = GetMeetupsRepositoryMock();
  final usecase = GetMeetupsImpl(repository);
  test('Should return a list of meetups', () async {
    when(() => repository.get()).thenAnswer((_) async => Right(<ResultMeetups>[]));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<ResultMeetups>>());
  });

  test('Should return a FailureGetMeetups in case of requisition error', () async {
    when(() => repository.get()).thenAnswer((_) async => Left(FailureGetMeetups()));
    final result = await usecase();
    expect(result.fold(id, id), isA<FailureGetMeetups>());
  });
}
