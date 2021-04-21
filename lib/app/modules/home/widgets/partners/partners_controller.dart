import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../domain/entities/result_partners.dart';
import '../../domain/usecases/get_partners.dart';

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
  fetchPartners() {
    usecase.call().fold(
          (l) => error = l.toString(),
          (r) => partners = r.asObservable(),
        );
  }
}
