import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/youtube_repository.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_youtube.dart';
import 'package:mocktail/mocktail.dart';

class YoutubeRepositorySpy extends Mock implements YoutubeRepository {}

main() {
  final repository = YoutubeRepositorySpy();
  final usecase = GetYoutubeImpl(repository);
  test('Should return a list of youtube videos', () async {
    when(() => repository.get()).thenAnswer((_) async => Right(<ResultYoutube>[]));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<ResultYoutube>>());
  });

  test('Should return a FailureGetYoutube in case of requisition error', () async {
    when(() => repository.get()).thenAnswer((_) async => Left(FailureGetYoutube()));
    final result = await usecase();
    expect(result.fold(id, id), isA<FailureGetYoutube>());
  });
}
