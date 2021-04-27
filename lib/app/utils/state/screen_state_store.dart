import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/utils/state/screen_state.dart';
import 'package:mobx/mobx.dart';

part 'screen_state_store.g.dart';

@Injectable()
class ScreenStateStore = _ScreenStateStoreBase with _$ScreenStateStore;

abstract class _ScreenStateStoreBase with Store {
  @observable
  ScreenState state = OnState();

  void onState() {
    state = OnState();
  }

  void onLoading() {
    state = LoadingState();
  }

  void onError() {
    state = ErrorState();
  }
}
