import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class PartnersRepository {
  Either<FailureGetPartners, List<ResultPartners>> get();
}
