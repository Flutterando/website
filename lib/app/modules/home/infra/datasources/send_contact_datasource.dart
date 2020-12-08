import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';

abstract class SendContactDatasource {
  Future<ResultContact> sendContact(ContactModel contact);
}
