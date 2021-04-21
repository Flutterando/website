import '../../domain/entities/send_contact/result_contact.dart';
import '../models/send_contact/contact_model.dart';

abstract class SendContactDatasource {
  Future<ResultContact> sendContact(ContactModel contact);
}
