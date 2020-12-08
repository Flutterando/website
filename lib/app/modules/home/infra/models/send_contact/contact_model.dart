import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';

class ContactModel implements Contact {
  final String name;
  final String email;
  final String message;

  ContactModel({this.name, this.email, this.message});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactModel(
      name: map['name'],
      email: map['email'],
      message: map['message'],
    );
  }

  factory ContactModel.fromContact(Contact contact) {
    if (contact == null) return null;

    return ContactModel(
      name: contact.name,
      email: contact.email,
      message: contact.message,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));
}
