import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'packages_controller.g.dart';

@Injectable()
class PackagesController = _PackagesControllerBase with _$PackagesController;

abstract class _PackagesControllerBase with Store {
  final ScreenSize screen;
  final GetPackages usecase;
  final UrlLauncher urlLauncher;
  _PackagesControllerBase(this.screen, this.usecase, this.urlLauncher) {
    fetchPackages();
  }

  @observable
  ObservableList<ResultPackage> packages = <ResultPackage>[].asObservable();

  @observable
  String error = "";

  @action
  fetchPackages() async {
    var response = await usecase.call();
    response.fold(
          (l) => error = l.toString(),
          (r) => packages = r.asObservable(),
        );
  }
}
