import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_brazilian_cases.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'brazilian_cases_controller.g.dart';

@Injectable()
class BrazilianCasesController = _BrazilianCasesControllerBase
    with _$BrazilianCasesController;

abstract class _BrazilianCasesControllerBase with Store {
  final ScreenSize screen;
  final GetBrazilianCases usecase;
  final UrlLauncher urlLauncher;
  _BrazilianCasesControllerBase(this.screen, this.usecase, this.urlLauncher) {
    fetchBrazilianCases();
  }

  @observable
  ObservableList<ResultBrazilianCases> brazilianCases = <ResultBrazilianCases>[].asObservable();

  @observable
  String error = "";

  @action
  fetchBrazilianCases() async {
    var response = await usecase();
    response.fold(
      (l) => error = l.toString(),
      (r) => brazilianCases = r.asObservable(),
    );
  }
}
