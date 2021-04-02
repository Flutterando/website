import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'footer_controller.g.dart';

@Injectable()
class FooterController = _FooterControllerBase with _$FooterController;

abstract class _FooterControllerBase with Store {
  late final ScreenSize screen;
  late final SendContact usecase;
  late final UrlLauncher urlLauncher;
  _FooterControllerBase(this.screen, this.usecase, this.urlLauncher);

  @observable
  ResultContact resultContact = ResultContact("");

  @observable
  String messageError = "";

  @observable
  bool loadingSendContact = false;

  @action
  sendContact(Contact contact) async {
    loadingSendContact = true;
    final response = await usecase(contact);
    response.fold((l) {
      if (l is SendContactExternalError) {
        messageError = "Ocorreu um erro Externo!";
      }
      if (l is InvalidContactError) {
        messageError = l.message;
      }
    }, (r) => resultContact = r);
    await Future.delayed(Duration(seconds: 3));
    loadingSendContact = false;
    messageError = "";
    resultContact = ResultContact("");
  }
}
