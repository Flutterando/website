class FailureSendContact implements Exception {}

class InvalidContactError implements FailureSendContact {
  final String message;

  InvalidContactError({
    required this.message,
  });
}

class SendContactExternalError implements FailureSendContact {
  final String message;
  
  SendContactExternalError({
    required this.message,
  });
}
