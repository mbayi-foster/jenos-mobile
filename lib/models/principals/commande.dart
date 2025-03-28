import 'package:jenos_app/models/principals/panier.dart';

class Commande {
  int id;
  String ticket;
  double prix;
  bool status;
  bool confirm;
  bool livraison;
  String adresse;

  // longitude et latitude de la commande en cours de livraison
  double long;
  double lat;

  // paniers de la commande
  List<Panier> panier;
  bool facture;
  int livreurId;
  DateTime createdAt;

  Commande({
    required this.id,
    required this.ticket,
    required this.status,
    required this.prix,
    required this.confirm,
    required this.livraison,
    required this.adresse,
    this.long = 0.0,
    this.lat = 0.0,
    this.panier = const [],
    required this.facture,
    this.livreurId = 0,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Commande.fromJson(Map<String, dynamic> json) {
    List<Panier> panierList = const [];
    if (json['paniers'] != null) {
      var panierJson = json['paniers'] as List;
      panierList =
          panierJson.map((panierJson) => Panier.fromJson(panierJson)).toList();
    }
    return Commande(
      id: json["id"] != null ? json['id'] : 0,
      ticket: json['ticket'] ?? "",
      status: json['status'] == 1,
      prix: json["prix"] != null ? double.parse(json['prix']) : 0.0,
      confirm: json['confirm'] == 1,
      livraison: json['livraison'] == 1,
      adresse: json['adresse'] ?? "",
      long: json['longitude'] != null ? double.parse(json['longitude']) : 0.0,
      lat: json['latitude'] != null ? double.parse(json["latitude"]) : 0.0,
      facture: json["facture"] == 1,
      panier: panierList,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),
    );
  }
}
