import '../../../../data/packages_data.dart';
import '../../infra/datasources/packages_datasource.dart';
import '../../infra/models/result_packages_model.dart';

class PackagesLocalDatasource implements PackagesDatasource {
  final PackagesData packages;
  PackagesLocalDatasource(this.packages);

  @override
  List<ResultPackagesModel> getPackages() {
    final response = packages.get();
    final listPackages = response
        .map(
          (e) => ResultPackagesModel.fromMap(e),
        )
        .toList();
    return listPackages;
  }
}
