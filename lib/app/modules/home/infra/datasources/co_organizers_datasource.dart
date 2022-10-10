import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';

abstract class CoOrganizersDatasource {
  Future<List<ResultCoOrganizers>> getCoOrganizers();
}
