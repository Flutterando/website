import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_meetups.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';

part 'latest_meetups_controller.g.dart';

@Injectable()
class LatestMeetupsController = _LatestMeetupsControllerBase with _$LatestMeetupsController;

abstract class _LatestMeetupsControllerBase with Store {
  final ScreenSize screen;
  final GetMeetups usecase;

  _LatestMeetupsControllerBase(this.screen, this.usecase) {
    fetchMeetups();
  }

  @observable
  ObservableList<ResultMeetups> meetups = <ResultMeetups>[].asObservable();

  @observable
  String error = "";

  @action
  fetchMeetups() async {
    var response = await usecase();
    response.fold(
      (l) => error = l.toString(),
      (r) => meetups = r.asObservable(),
    );
  }
}
