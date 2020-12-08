import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/infra/datasources/send_contact_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';

class SendContactServerDatasource implements SendContactDatasource {
  final Map<String, String> envVars;
  final Dio dio;
  SendContactServerDatasource(this.dio) : envVars = DotEnv().env;
  @override
  Future<ResultContact> sendContact(ContactModel contact) async {
    final response = await dio.get(
      envVars["urlSendContact"],
      queryParameters: contact.toMap(),
    );
    if (response.statusCode == 200) {
      return ResultContact('O seu email foi enviado com sucesso!');
    } else {
      throw SendContactExternalError(
        message: response.statusMessage,
      );
    }
  }
}
