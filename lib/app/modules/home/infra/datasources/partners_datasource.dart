import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';

abstract class PartnersDatasource {
  Future<List<ResultPartnersModel>> getPartners();
}
