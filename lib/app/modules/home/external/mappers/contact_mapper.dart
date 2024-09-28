import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';

class ContactMapper {
  static Map<String, dynamic> toMap(Contact contact) {
    return {
      'name': contact.name,
      'email': contact.email,
      'message': contact.message,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return Contact(name: '', email: '', message: '');

    return Contact(
      name: map['name'] ??= '',
      email: map['email'] ??= '',
      message: map['message'] ??= '',
    );
  }

  static Contact fromContact(Contact contact) {
    if (contact.email.isEmpty) {
      return Contact(
        name: '',
        email: '',
        message: '',
      );
    }

    return Contact(
      name: contact.name,
      email: contact.email,
      message: contact.message,
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static Contact fromJson(String source) => ContactMapper.fromMap(json.decode(source));
}
