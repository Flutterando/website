import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';

part 'partners_controller.g.dart';

@Injectable()
class PartnersController = _PartnersControllerBase with _$PartnersController;

abstract class _PartnersControllerBase with Store {
  final ScreenSize screen;
  final GetPartners usecase;
  _PartnersControllerBase(this.screen, this.usecase) {
    fetchPartners();
  }

  @observable
  ObservableList<ResultPartners> partners = <ResultPartners>[].asObservable();

  @observable
  String error = "";

  @action
  fetchPartners() async {
    var response = await usecase.call();
    response.fold(
      (l) => error = l.toString(),
      (r) => partners = r.asObservable(),
    );
  }
}
