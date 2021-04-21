import '../models/result_co_organizers_model.dart';

abstract class CoOrganizersDatasource {
  List<ResultCoOrganizersModel> getCoOrganizers();
}
