import 'package:dio/dio.dart';
import 'package:flutterando/app/utils/errors/http_error.dart';

class HttpService {
  final Dio dio;
  HttpService(this.dio);

  Future<Response> get(String path) async {
    Options option = Options(
      receiveTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      headers: {'content-type': 'application/json'},
    );
    final response = await dio.get(path, options: option).catchError((error) => _onError(error));
    return response;
  }

  _onError(dynamic error) {
    if (error is DioException && error.type == DioExceptionType.badResponse) {
      throw HttpResponseError(message: error.toString());
    }
    throw error;
  }
}
