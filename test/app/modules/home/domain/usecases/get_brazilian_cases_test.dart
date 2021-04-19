import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_brazilian_cases.dart';
import 'package:mocktail/mocktail.dart';

class BrazilianCasesRepositoryMock extends Mock implements BrazilianCasesRepository {}

main() {
  final BrazilianCasesRepository repository = BrazilianCasesRepositoryMock();
  final usecase = GetBrazilianCasesImpl(repository);

  test('Should return a list of brazilian cases', () async {
    when(() => repository.get()).thenAnswer((_) async => Right(<ResultBrazilianCases>[]));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<ResultBrazilianCases>>());
  });

  test('Should return a FailureGetBrazilianCases in case of requisition error', () async {
    when(() => repository.get()).thenAnswer((_) async => Left(FailureGetBrazilianCases()));
    final result = await usecase();
    expect(result.fold(id, id), isA<FailureGetBrazilianCases>());
  });
}
