import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';

abstract class SendContactRepository {
  Future<Either<FailureSendContact, ResultContact>> send(Contact contact);
}
