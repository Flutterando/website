import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/packages_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:mocktail/mocktail.dart';

class PackagesRepositoryMock extends Mock implements PackagesRepository {}

main() {
  final repository = PackagesRepositoryMock();
  final usecase = GetPackagesImpl(repository);
  test('Should return a list of packages', () {
    when(() => repository.get()).thenAnswer((_) => Right(<ResultPackage>[]));
    final result = usecase();
    expect(result.fold(id, id), isA<List<ResultPackage>>());
  });

  test('Should return a FailureGetPackages in case of requisition error', () {
    when(() => repository.get()).thenAnswer((_) => Left(FailureGetPackages()));
    final result = usecase();
    expect(result.fold(id, id), isA<FailureGetPackages>());
  });
}
