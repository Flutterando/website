class FailureSendContact implements Exception {}

class InvalidContactError implements FailureSendContact {
  final String message;
  InvalidContactError({this.message});
}

class SendContactExternalError implements FailureSendContact {
  final String message;
  SendContactExternalError({this.message});
}
