import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_brazilian_cases.dart';
import 'package:mockito/mockito.dart';

class BrazilianCasesRepositoryMock extends Mock
    implements BrazilianCasesRepository {}

main() {
  final repository = BrazilianCasesRepositoryMock();
  final usecase = GetBrazilianCasesImpl(repository);
  test('Should return a list of brazilian cases', () {
    when(repository.get()).thenAnswer((_) => Right(<ResultBrazilianCases>[]));
    final result = usecase();
    expect(result, isA<Right>());
    expect(result.getOrElse(() => null), isA<List<ResultBrazilianCases>>());
  });

  test('Should return a FailureGetBrazilianCases in case of requisition error',
      () {
    when(repository.get()).thenAnswer((_) => Left(FailureGetBrazilianCases()));
    final result = usecase();
    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<FailureGetBrazilianCases>());
  });
}
