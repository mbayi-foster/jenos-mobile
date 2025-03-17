// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'package:jenos_app/models/principals/plat.dart';
import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  int id;
  String nom;
  String photo;
  List<Plat?> plats;
  int count;
  DateTime createdAt;

  Menu({
    required this.id,
    required this.count,
    required this.nom,
    required this.photo,
    required this.plats,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"] ?? 0,
        count: json["nbre_plats"] ?? 0,
        nom: json["nom"] ?? "",
        photo: json["photo"] ?? "",
        plats: json['plats'] != null
            ? List<Plat>.from(json["plats"].map((x) => x))
            : [],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nbre_plats": count,
        "nom": nom,
        "photo": photo,
        "plats": List<dynamic>.from(plats.map((x) => x)),
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
