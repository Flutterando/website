import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

import '../../domain/errors/errors.dart';

class PackagesStore extends StreamStore<FailureGetPackages, List<ResultPackage>> {
  final ScreenSize screen;
  final GetPackages usecase;

  PackagesStore(this.screen, this.usecase) : super([]) {
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    var response = await usecase.call();
    response.fold(
      (l) => setError(l),
      (packages) => update(packages),
    );
  }
}
