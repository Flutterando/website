import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_founders.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'founders_controller.g.dart';

@Injectable()
class FoundersController = _FoundersControllerBase with _$FoundersController;

abstract class _FoundersControllerBase with Store {
  final GetFounders usecase;
  final UrlLauncher urlLauncher;
  final ScreenSize screen;
  _FoundersControllerBase(this.screen, this.usecase, this.urlLauncher) {
    fetchPartners();
  }

  @observable
  ObservableList<ResultFounders> founders = <ResultFounders>[].asObservable();

  @observable
  String error = "";

  @action
  fetchPartners() async {
    var response = await usecase.call();
    response.fold(
      (l) => error = l.toString(),
      (r) => founders = r.asObservable(),
    );
  }
}
