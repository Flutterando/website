import '../../../../data/brazilian_cases_data.dart';
import '../../infra/datasources/brazilian_cases_datasource.dart';
import '../../infra/models/result_brazilian_cases_model.dart';

class BrazilianCasesLocalDatasource implements BrazilianCasesDatasource {
  final BrazilianCasesData brazilianCases;
  BrazilianCasesLocalDatasource(this.brazilianCases);

  @override
  List<ResultBrazilianCasesModel> getBrazilianCases() {
    final response = brazilianCases.get();
    final listBrazilianCases = response
        .map(
          (e) => ResultBrazilianCasesModel.fromMap(e),
        )
        .toList();
    return listBrazilianCases;
  }
}
