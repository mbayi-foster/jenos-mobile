import 'package:jenos_app/models/principals/place.dart';

class Livreur {
  String nom;
  String prenom;
  Place? adresse;
  String telephone;

  Livreur(
      {this.adresse,
      required this.nom,
      required this.prenom,
      required this.telephone});

      
  factory Livreur.fromJson(Map<String, dynamic> json) => Livreur(
        nom: json['nom'],
        prenom: json['prenom'],
        adresse:
            json['adresse'] != null ? Place.fromJson(json['adresse']) : null,
        telephone: json['phone'],
      );
}
