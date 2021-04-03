import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/co_organizers_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_co_organizers.dart';
import 'package:mocktail/mocktail.dart';

class CoOrganizersRepositoryMock extends Mock
    implements CoOrganizersRepository {}

main() {
  final repository = CoOrganizersRepositoryMock();
  final usecase = GetCoOrganizersImpl(repository);
  test('Should return a list of co-organizers', () {
    when(() => repository.get()).thenAnswer((_) => Right(<ResultCoOrganizers>[]));
    final result = usecase();
    expect(result.fold(id, id), isA<List<ResultCoOrganizers>>());
  });

  test('Should return a FailureGetPartners in case of requisition error', () {
    when(() => repository.get()).thenAnswer((_) => Left(FailureGetCoOrganizers()));
    final result = usecase();
    expect(result.fold(id, id), isA<FailureGetCoOrganizers>());
  });
}
