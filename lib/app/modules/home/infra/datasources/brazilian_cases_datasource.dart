import '../models/result_brazilian_cases_model.dart';

abstract class BrazilianCasesDatasource {
  List<ResultBrazilianCasesModel> getBrazilianCases();
}
