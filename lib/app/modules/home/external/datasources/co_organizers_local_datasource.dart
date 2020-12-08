import 'package:flutterando/app/data/co_organizers_data.dart';
import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_co_organizers_model.dart';

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
