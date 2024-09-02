import 'dart:convert';

class User{
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    email: json['email'],
    password: json['password'],
  );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['nama'] = nama;
  //   data['nomor_induk'] = nomor_induk;
  //   data['role'] = role;
  //   data['password'] = password;
  //   data['nomorWA'] = nomorWA;
  //   return data;
  // }

  static List<User> parseJson(String json) {
    var parsed = jsonDecode(json);
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}