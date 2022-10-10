import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';

abstract class PackagesDatasource {
  Future<List<ResultPackage>> getPackages();
}
