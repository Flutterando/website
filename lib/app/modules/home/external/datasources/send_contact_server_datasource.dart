import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors_send_contact.dart';
import 'package:flutterando/app/modules/home/infra/datasources/send_contact_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/send_contact/contact_model.dart';

class SendContactServerDatasource implements SendContactDatasource {
  final Dio dio;
  late Map<String, dynamic> envVars;
  SendContactServerDatasource(this.dio, this.envVars) {
    envVars = env;
  }

  @override
  Future<ResultContact> sendContact(ContactModel contact) async {
    try {
      await dio.get(envVars["urlSendContact"], queryParameters: contact.toMap());
      return ResultContact('O seu email foi enviado com sucesso!'); 
    } on DioError catch(e) {
      throw SendContactExternalError(
        message: e.response?.statusMessage ?? "Eror ao enviar o Email!"
      );
    } catch(e) {
      throw SendContactExternalError(
        message: "O Email não foi enviado!"
      );
    }
  }
}
