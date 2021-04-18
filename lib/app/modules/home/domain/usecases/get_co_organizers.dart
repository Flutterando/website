import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/co_organizers_repository.dart';

abstract class GetCoOrganizers {
  Future<Either<FailureGetCoOrganizers, List<ResultCoOrganizers>>> call();
}

class GetCoOrganizersImpl extends GetCoOrganizers {
  final CoOrganizersRepository repository;
  GetCoOrganizersImpl(this.repository);
  @override
  Future<Either<FailureGetCoOrganizers, List<ResultCoOrganizers>>> call() async {
    return await repository.get();
  }
}
