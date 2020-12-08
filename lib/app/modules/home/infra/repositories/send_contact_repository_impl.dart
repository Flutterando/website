import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/repositories/send_contact_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/send_contact_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';

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
    } on DioError catch (e) {
      return Right(ResultContact("E-mail enviado com sucesso!"));
    } catch (e) {
      return Left(SendContactExternalError());
    }
  }
}
