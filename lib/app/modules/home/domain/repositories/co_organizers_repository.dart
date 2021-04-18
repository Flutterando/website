import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class CoOrganizersRepository {
  Future<Either<FailureGetCoOrganizers, List<ResultCoOrganizers>>> get();
}
