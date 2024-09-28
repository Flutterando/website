import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class YoutubeRepository {
  Future<Either<FailureGetYoutube, List<ResultYoutube>>> get();
}
