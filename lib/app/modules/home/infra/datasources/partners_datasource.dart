import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';

abstract class PartnersDatasource {
  Future<List<ResultPartners>> getPartners();
}
