import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';

abstract class BrazilianCasesDatasource {
  Future<List<ResultBrazilianCases>> getBrazilianCases();
  Future<ResultFollowers> getFolowers();
}
