abstract class HttpError implements Exception {
  String message;
  HttpError(this.message);
}

class HttpResponseError extends HttpError {
  HttpResponseError({required String message}) : super(message);

  @override
  String toString() {
    return message;
  }
}
