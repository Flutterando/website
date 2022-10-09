import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';

abstract class SendContactDatasource {
  Future<ResultContact> sendContact(Contact contact);
}
