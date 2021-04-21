import '../../../../data/co_organizers_data.dart';
import '../../infra/datasources/co_organizers_datasource.dart';
import '../../infra/models/result_co_organizers_model.dart';

class CoOrganizersLocalDatasource implements CoOrganizersDatasource {
  final CoOrganizersData coOrganizers;
  CoOrganizersLocalDatasource(this.coOrganizers);
  @override
  List<ResultCoOrganizersModel> getCoOrganizers() {
    final response = coOrganizers.get();
    final listCoOrganizers = response
        .map(
          (e) => ResultCoOrganizersModel.fromMap(e),
        )
        .toList();
    return listCoOrganizers;
  }
}
