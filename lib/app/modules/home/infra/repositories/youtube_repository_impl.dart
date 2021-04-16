import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/youtube_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  final YoutubeDatasource datasource;
  YoutubeRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureGetYoutube, List<ResultYoutube>>> get() async {
    try {
      final result = await datasource.getYoutube();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
