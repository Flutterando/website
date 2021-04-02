bool emailValidation(String email) {
  bool emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
  return emailValid;
}

String? emailValidationText(String? email) {
  if (emailValidation(email!)) {
    return "";
  }
  if (!isNotEmptyValidation(email)) {
    return "Este campo é requerido!";
  } else {
    return "E-mail inválido!";
  }
}

bool isNotEmptyValidation(String field) {
  bool fieldValid = (field != '');
  return fieldValid;
}

String? isNotEmptyValidationText(String? field) {
  if (isNotEmptyValidation(field!)) {
    return "";
  } else {
    return "Este campo é requerido!";
  }
}
