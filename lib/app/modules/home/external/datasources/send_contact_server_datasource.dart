import 'package:dio/dio.dart';

import '../../domain/entities/send_contact/result_contact.dart';
import '../../domain/errors/errors_send_contact.dart';
import '../../infra/datasources/send_contact_datasource.dart';
import '../../infra/models/send_contact/contact_model.dart';

class SendContactServerDatasource implements SendContactDatasource {
  final Dio dio;
  late Map<String, dynamic> envVars;
  SendContactServerDatasource(this.dio, this.envVars);

  @override
  Future<ResultContact> sendContact(ContactModel contact) async {
    var response = await dio.get(envVars["urlSendContact"],
        queryParameters: contact.toMap());

    if (response.statusCode == 201) {
      return ResultContact('O seu email foi enviado com sucesso!');
    } else {
      throw SendContactExternalError(message: "Eror ao enviar o Email!");
    }
  }
}
