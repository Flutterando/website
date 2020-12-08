import 'package:flutterando/app/data/partners_data.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';

class PartnersLocalDatasource implements PartnersDatasource {
  final PartnersData partners;

  PartnersLocalDatasource(this.partners);
  @override
  List<ResultPartnersModel> getPartners() {
    final response = partners.get();
    final listPartners =
        response.map((String e) => ResultPartnersModel(e)).toList();
    return listPartners;
  }
}
