import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  ObservableList<ResultPartners> partners;

  @observable
  String error;

  @action
  fetchPartners() {
    usecase.call().fold(
          (l) => error = l.toString(),
          (r) => partners = r.asObservable(),
        );
  }
}
