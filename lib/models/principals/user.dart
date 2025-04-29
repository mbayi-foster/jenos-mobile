// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:jenos_app/models/principals/place.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  int uid;
  String nom;
  String prenom;
  String email;
  Place? adresse;
  String phone;
  String photo;
  DateTime createdAt;
  String token;

  User({
    required this.id,
    required this.uid,
    required this.nom,
    this.prenom = "",
    required this.email,
    required this.phone,
    this.adresse,
    this.photo = "",
    this.token="",
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory User.fromJson(Map<String, dynamic> json) {
    Place? place =
        (json['adresse'] != null) ? Place.fromJson(json['adresse']) : null;
    return User(
      id: json["id"] ?? 0,
      uid:json['uid'] ?? 0,
      nom: json["nom"],
      prenom: json["prenom"] ?? "",
      email: json["email"],
      phone: json["phone"].toString() ?? "",
      photo: json["photo"] ?? "",
      adresse: json['adresse'] != null ? place : null,
      token:json['token'] ?? "",
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "uid":uid,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "phone": phone,
        "photo": photo,
        "adresse": adresse?.toJson(),
        "token":token,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
