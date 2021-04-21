import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/insta_followers_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_insta_followers.dart';
import 'package:mocktail/mocktail.dart';

class InstaFollowersRepositoryMock extends Mock
    implements InstaFollowersRepository {}

main() {
  final InstaFollowersRepository repository = InstaFollowersRepositoryMock();
  final usecase = GetInstaFollowersImpl(repository);

  test('Should return instagram followers number', () async {
    when(() => repository.getInstaFollowers()).thenAnswer(
        (_) async => Right(ResultInstaFollowers(followersNumber: 5)));
    final result = await usecase();
    expect(result.fold(id, id), isA<ResultInstaFollowers>());
  });

  test('Should return a FailureGetInstaFollowers in case of requisition error',
      () async {
    when(() => repository.getInstaFollowers())
        .thenAnswer((_) async => Left(FailureInstaFollowers()));
    final result = await usecase();
    expect(result.fold(id, id), isA<FailureInstaFollowers>());
  });
}
