import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/youtube_repository.dart';

abstract class GetYoutube {
  Future<Either<FailureGetYoutube, List<ResultYoutube>>> call();
}

class GetYoutubeImpl implements GetYoutube {
  final YoutubeRepository repository;
  GetYoutubeImpl(this.repository);
  @override
  Future<Either<FailureGetYoutube, List<ResultYoutube>>> call() async {
    return await repository.get();
  }
}