import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_meetups.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  ObservableList<ResultMeetups> meetups;

  @observable
  String error;

  @action
  fetchMeetups() {
    usecase().fold(
      (l) => error = l.toString(),
      (r) => meetups = r.asObservable(),
    );
  }
}
