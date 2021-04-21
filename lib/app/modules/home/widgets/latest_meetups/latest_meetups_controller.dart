import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../../../utils/url_launcher/url_launcher.dart';
import '../../domain/entities/result_meetups.dart';
import '../../domain/usecases/get_meetups.dart';

part 'latest_meetups_controller.g.dart';

@Injectable()
class LatestMeetupsController = _LatestMeetupsControllerBase
    with _$LatestMeetupsController;

abstract class _LatestMeetupsControllerBase with Store {
  final ScreenSize screen;
  final GetMeetups usecase;
  final UrlLauncher urlLauncher;
  _LatestMeetupsControllerBase(this.screen, this.usecase, this.urlLauncher) {
    fetchMeetups();
  }

  @observable
  ObservableList<ResultMeetups> meetups = <ResultMeetups>[].asObservable();

  @observable
  String error = "";

  @action
  fetchMeetups() {
    usecase().fold(
      (l) => error = l.toString(),
      (r) => meetups = r.asObservable(),
    );
  }
}
