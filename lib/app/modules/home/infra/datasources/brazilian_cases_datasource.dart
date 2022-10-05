import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';

abstract class BrazilianCasesDatasource {
  Future<List<ResultBrazilianCasesModel>> getBrazilianCases();
  Future<ResultFolowers> getFolowers();
}
