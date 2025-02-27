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
  String details;
  String photo;
  List<Plat?> plats;
  DateTime createdAt;

  Menu({
    required this.id,
    required this.nom,
    required this.details,
    required this.photo,
    required this.plats,
    required this.createdAt,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"] ?? 0,
        nom: json["nom"],
        details: json["details"],
        photo: json["photo"],
        plats: List<Plat>.from(json["plats"].map((x) => x)),
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "details": details,
        "photo": photo,
        "plats": List<dynamic>.from(plats.map((x) => x)),
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
