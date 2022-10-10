import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

class FooterController extends StreamStore<FailureSendContact, ResultContact> {
  late final ScreenSize screen;
  late final SendContact usecase;
  FooterController(this.screen, this.usecase) : super(ResultContact(''));

  Future<void> sendContact(Contact contact) async {
    setLoading(true);
    final response = await usecase(contact);
    response.fold((l) {
      if (l is SendContactExternalError) {
        setError(l);
      }
      if (l is InvalidContactError) {
        setError(l);
      }
    }, (r) {
      update(r);
    });

    await Future.delayed(Duration(seconds: 1));
    setLoading(false);
    update(ResultContact(""));
  }
}
