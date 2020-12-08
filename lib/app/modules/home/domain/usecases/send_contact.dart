import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/domain/repositories/send_contact_repository.dart';
import 'package:flutterando/app/utils/validations/validations.dart';

abstract class SendContact {
  Future<Either<FailureSendContact, ResultContact>> call(Contact contact);
}

class SendContactImpl implements SendContact {
  final SendContactRepository repository;
  SendContactImpl(this.repository);
  @override
  Future<Either<FailureSendContact, ResultContact>> call(
      Contact contact) async {
    String fieldsError = verifyFields(contact);
    if (fieldsError != '') {
      return Left(InvalidContactError(message: fieldsError));
    }
    return repository.send(contact);
  }

  String verifyFields(Contact contact) {
    String messageError = '';
    if (contact.name == null || contact.name == '') {
      messageError += "O campo nome não pode estar vazio!\n";
    }
    if (!emailValidation(contact.email)) {
      messageError += "O campo email não esta formatado corretamente!\n";
    }
    if (contact.message == null || contact.message == '') {
      messageError = "O campo mensagem não pode estar vazio!\n";
    }
    return messageError;
  }
}
