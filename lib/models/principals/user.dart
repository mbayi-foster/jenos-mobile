// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String nom;
  String prenom;
  String email;
  String adresse;
  String phone;
  String photo;
  DateTime createdAt;

  User({
    required this.id,
    required this.nom,
    this.prenom = "",
    required this.email,
    required this.phone,
    this.adresse = "",
    this.photo = "",
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        nom: json["nom"],
        prenom: json["prenom"] ?? "",
        email: json["email"],
        phone: json["phone"] ?? "",
        photo: json["photo"] ?? "",
        adresse: json["adresse"] ?? "",
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "phone": phone,
        "photo": photo,
        "adresse": adresse,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
