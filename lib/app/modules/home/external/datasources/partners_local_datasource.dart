import '../../../../data/partners_data.dart';
import '../../infra/datasources/partners_datasource.dart';
import '../../infra/models/result_partners_model.dart';

class PartnersLocalDatasource implements PartnersDatasource {
  final PartnersData partners;

  PartnersLocalDatasource(this.partners);
  @override
  List<ResultPartnersModel> getPartners() {
    final response = partners.get();
    final listPartners = response
        .map((String photo) => ResultPartnersModel(photoUrl: photo))
        .toList();
    return listPartners;
  }
}
