import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_insta_followers.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/state/screen_state_store.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'header_controller.g.dart';

@Injectable()
class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {
  final GetInstaFollowers _getInstaFollowers;
  final ScreenSize screen;
  final UrlLauncher urlLauncher;
  late ResultInstaFollowers resultInstaFollowers;

  ScreenStateStore socialMediaState;

  _HeaderControllerBase(
    this.screen,
    this.urlLauncher,
    this.socialMediaState,
    this._getInstaFollowers,
  );

  @action
  Future<void> getInstaFollowers() async {
    socialMediaState.onLoading();
    final result = await _getInstaFollowers();
    result.fold(
      (l) {
        socialMediaState.onError();
      },
      (r) {
        resultInstaFollowers = r;
        socialMediaState.onState();
      },
    );
  }
}
