import 'package:dartz/dartz.dart';

import '../../../../utils/validations/validations.dart';
import '../entities/send_contact/contact.dart';
import '../entities/send_contact/result_contact.dart';
import '../errors/errors_send_contact.dart';
import '../repositories/send_contact_repository.dart';

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
    if (contact.name.isEmpty || contact.name == '') {
      messageError += "O campo nome não pode estar vazio!\n";
    }
    if (!emailValidation(contact.email)) {
      messageError += "O campo email não esta formatado corretamente!\n";
    }
    if (contact.message.isEmpty || contact.message == '') {
      messageError = "O campo mensagem não pode estar vazio!\n";
    }
    return messageError;
  }
}
