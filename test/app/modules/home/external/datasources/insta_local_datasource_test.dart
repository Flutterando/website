import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_insta_followers_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/insta_followers_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class InstaFollowersDataSourceMock extends Mock
    implements InstaFollowersDatasource {}

main() {
  final packages = InstaFollowersDataSourceMock();
  final datasource = InstaFollowersRepositoryImpl(packages);
  test('Should return a list of ResultPackagesModel', () async {
    when(() => packages.getInstaFollowers()).thenAnswer(
        (_) async => ResultInstaFollowersModel(userFollowerNumber: 20));
    final result = await datasource.getInstaFollowers();
    expect(result.fold(id, id), isA<ResultInstaFollowersModel>());
  });
}
