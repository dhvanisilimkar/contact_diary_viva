import 'dart:io';

class Contacts {
  String firstName;
  String lastName;
  String contact;
  String email;

  File? image;

  Contacts({
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.email,
    this.image,
  });
}
