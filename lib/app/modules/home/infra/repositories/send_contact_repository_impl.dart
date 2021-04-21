import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/send_contact/contact.dart';
import '../../domain/entities/send_contact/result_contact.dart';
import '../../domain/errors/errors_send_contact.dart';
import '../../domain/repositories/send_contact_repository.dart';
import '../datasources/send_contact_datasource.dart';
import '../models/send_contact/contact_model.dart';

class SendContactRepositoryImpl implements SendContactRepository {
  final SendContactDatasource datasource;
  SendContactRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSendContact, ResultContact>> send(
      Contact contact) async {
    try {
      final contactModel = ContactModel.fromContact(contact);
      final result = await datasource.sendContact(contactModel);
      return Right(result);
    } on DioError catch (_) {
      return Right(ResultContact("E-mail enviado com sucesso!"));
    } catch (e) {
      return Left(
          SendContactExternalError(message: "Erro ao enviar o E-mail!"));
    }
  }
}
