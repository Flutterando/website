import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';

import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_insta_followers_model.dart';

import 'package:flutterando/app/modules/home/infra/repositories/insta_followers_repository_impl.dart';

import 'package:mocktail/mocktail.dart';

class InstaFollowersDatasourceMock extends Mock
    implements InstaFollowersDatasource {}

main() {
  final datasource = InstaFollowersDatasourceMock();
  final repository = InstaFollowersRepositoryImpl(datasource);
  /* late ResultInstaFollowers resultado;

  setUpAll(() {
    resultado = ResultInstaFollowers(followersNumber: 20);
  }); */

  test('Should return a list of ResultInstaFollowers', () async {
    when(() => datasource.getInstaFollowers()).thenAnswer(
        (_) async => ResultInstaFollowersModel(userFollowerNumber: 2));
    final result = await repository.getInstaFollowers();

    expect(result.fold(id, id), isA<ResultInstaFollowers>());
  });

  test('Should return a DatasourceError when datasource fail', () async {
    when(() => datasource.getInstaFollowers()).thenThrow(Exception());
    final result = await repository.getInstaFollowers();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
