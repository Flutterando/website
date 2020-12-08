import 'package:flutterando/app/modules/home/infra/models/result_packages_model.dart';

abstract class PackagesDatasource {
  List<ResultPackagesModel> getPackages();
}
