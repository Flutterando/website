import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';

class ContactModel implements Contact {
  final String name;
  final String email;
  final String message;

  ContactModel({required this.name, required this.email, required this.message});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ContactModel(name: "", email: "", message: "");

    return ContactModel(
      name: map['name'] ??= "",
      email: map['email'] ??= "",
      message: map['message'] ??= "",
    );
  }

  factory ContactModel.fromContact(Contact contact) {
    if (contact.email.isEmpty) return ContactModel(name: "", email: "", message: "");

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
