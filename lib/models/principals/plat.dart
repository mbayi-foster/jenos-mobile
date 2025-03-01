// To parse this JSON data, do
//
//     final plat = platFromJson(jsonString);

import 'dart:convert';

Plat platFromJson(String str) => Plat.fromJson(json.decode(str));

String platToJson(Plat data) => json.encode(data.toJson());

class Plat {
  int id;
  String nom;
  String details;
  String photo;
  double prix;
  int like;
  DateTime createdAt;

  Plat({
    required this.id,
    required this.nom,
    required this.details,
    required this.photo,
    required this.prix,
    this.like = 0,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Plat.fromJson(Map<String, dynamic> json) => Plat(
        id: json["id"] ?? 0,
        nom: json["nom"],
        details: json["details"],
        photo: json["photo"],
        prix: json["prix"].toDouble() ?? 0,
        like: json["like"].toInt() ?? 0,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "details": details,
        "photo": photo,
        "prix": prix,
        "like": like,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
