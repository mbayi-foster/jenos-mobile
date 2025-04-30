import 'package:jenos_app/models/principals/livreur.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/place.dart';

class Commande {
  int id;
  String ticket;
  double prix;
  double deliveryCoast;
  bool status;
  bool confirm;
  bool facture;
  String livraison;
  String paiement;
  Place? adresse;
  List<Panier> paniers;
  Livreur? livreur;
  DateTime createdAt;

  Commande({
    this.id = 0,
    required this.paiement,
    this.livreur,
    required this.ticket,
    required this.status,
    required this.prix,
    required this.deliveryCoast,
    required this.confirm,
    required this.livraison,
    required this.adresse,
    required this.facture,
    this.paniers = const [],
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
      id: json["id"] ?? 0,
      ticket: json['ticket'] ?? "",
      prix: json["prix"] != null ? json['prix'].toDouble() : 0.0,
      deliveryCoast: json["delivery_coast"] != null
          ? json['delivery_coast'].toDouble()
          : 0.0,
      status: json['status'] == 1,
      confirm: json['confirm'] == 1,
      facture: json["facture"] == 1,
      livraison: json['livraison'] ?? "null",
      paiement: json['paiement'] ?? "",
      adresse: json['adresse'] != null ? Place.fromJson(json['adresse']) : null,
      paniers: panierList,
      livreur:
          json['livreur'] != null ? Livreur.fromJson(json['livreur']) : null,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "ticket": ticket,
        "prix": prix,
        "deliveryCoast": deliveryCoast,
        "status": status,
        "confirm": confirm,
        "facture": facture,
        "livraison": livraison,
        "paiement": paiement,
        "adresse": adresse,
        "paniers": paniers,
        "livreur": livreur,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
