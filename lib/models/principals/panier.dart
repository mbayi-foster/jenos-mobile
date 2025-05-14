// To parse this JSON data, do
//
//     final panier = panierFromJson(jsonString);

import 'dart:convert';

import 'package:jenos_app/models/principals/plat.dart';

Panier panierFromJson(String str) => Panier.fromJson(json.decode(str));

String panierToJson(Panier data) => json.encode(data.toJson());

class Panier {
  int id;
  int clienId;
  int platId;
  Plat? plat;
  int qte;
  bool status;
  double prix;
  DateTime createdAt;

  Panier({
    required this.id,
    required this.clienId,
    required this.platId,
    required this.plat,
    required this.qte,
    required this.status,
    required this.prix,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Panier.fromJson(Map<String, dynamic> json) => Panier(
        id: json["id"] != null ? json['id'] : 0,
        clienId: json["client_id"] != null ? json["client_id"] : 0,
        platId: json["plat_id"] != null ? json['plat_id'] : 0,
        plat: json["plat"] != null ? Plat.fromJson(json["plat"]) : null,
        qte: json["qte"] != null ? json["qte"] : 0,
        status: json['status'] == 1,
        prix: json["prix"]  != null ? json['prix'].toDouble() : 0,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clienId,
        "plat_id": platId,
        "plat": plat,
        "qte": qte,
        "status": status,
        "prix": prix,
      };
}
