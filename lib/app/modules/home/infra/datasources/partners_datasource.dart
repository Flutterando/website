import '../models/result_partners_model.dart';

abstract class PartnersDatasource {
  List<ResultPartnersModel> getPartners();
}
