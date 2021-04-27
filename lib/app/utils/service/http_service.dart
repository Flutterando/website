import 'package:dio/dio.dart';
import 'package:flutterando/app/utils/errors/http_error.dart';

class HttpService {
  Dio dio;
  HttpService(this.dio);

  Future<Response> get(String path) async {
    Options option = Options()
      ..contentType = 'application/json'
      ..headers?['content-type'] = 'application/json'
      ..sendTimeout = 5000;
    final response = await dio
        .get(path, options: option)
        .catchError((error) => _onError(error));
    return response;
  }

  _onError(dynamic error) {
    if (error is DioError && error.type == DioErrorType.response) {
      throw HttpResponseError(message: error.toString());
    }
    throw error;
  }
}
