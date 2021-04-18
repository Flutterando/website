import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';

abstract class BrazilianCasesDatasource {
  Future<List<ResultBrazilianCasesModel>> getBrazilianCases();
}
