import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/partners_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:mocktail/mocktail.dart';

class PartnersRepositoryMock extends Mock implements PartnersRepository {}

main() {
  final repository = PartnersRepositoryMock();
  final usecase = GetPartnersImpl(repository);
  test('Should return a list of partners images url', () {
    when(() => repository.get()).thenAnswer((_) => Right(<ResultPartners>[]));
    final result = usecase();
    expect(result.fold(id, id), isA<List<ResultPartners>>());
  });

  test('Should return a FailureGetPartners in case of requisition error', () {
    when(() => repository.get()).thenAnswer((_) => Left(FailureGetPartners()));
    final result = usecase();
    expect(result.fold(id, id), isA<FailureGetPartners>());
  });
}
