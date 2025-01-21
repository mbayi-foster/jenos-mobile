// To parse this JSON data, do
//
//     final plat = platFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Plat platFromJson(String str) => Plat.fromJson(json.decode(str));

String platToJson(Plat data) => json.encode(data.toJson());

class Plat {
    int id;
    String nom;
    String details;
    String photo;
    int prix;
    int like;
    bool status;
    DateTime createdAt;

    Plat({
        required this.id,
        required this.nom,
        required this.details,
        required this.photo,
        required this.prix,
        this.like = 0,
        this.status = false,
        required this.createdAt,
    });

    factory Plat.fromJson(Map<String, dynamic> json) => Plat(
        id: json["id"],
        nom: json["nom"],
        details: json["details"],
        photo: json["photo"],
        prix: json["prix"],
        like: json["like"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "details": details,
        "photo": photo,
        "prix": prix,
        "like": like,
        "status": status,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}
