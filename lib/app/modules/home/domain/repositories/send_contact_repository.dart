import 'package:dartz/dartz.dart';
import '../entities/send_contact/contact.dart';
import '../entities/send_contact/result_contact.dart';
import '../errors/errors_send_contact.dart';

abstract class SendContactRepository {
  Future<Either<FailureSendContact, ResultContact>> send(Contact contact);
}
