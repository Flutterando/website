import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_youtube_model.dart';
import 'package:flutterando/app/modules/home/infra/repositories/youtube_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class YoutubeDatasourceSpy extends Mock implements YoutubeDatasource {}

main() {
  final datasource = YoutubeDatasourceSpy();
  final repository = YoutubeRepositoryImpl(datasource);
  test('Should return a list of ResultYoutube', () async {
    when(() => datasource.getYoutube()).thenAnswer(
      (_) async => <ResultYoutubeModel>[],
    );
    final result = await repository.get();

    expect(result.fold(id, id), isA<List<ResultYoutube>>());
  });

  test('Should return a DatasourceError when datasource fail', () async {
    when(() => datasource.getYoutube()).thenThrow(Exception());
    final result = await repository.get();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
