import 'package:jenos_app/models/principals/place.dart';

class CommandeRequest {
  List<int> paniers;
  int clientId;
  double prix;
  double deliveryCoast;
  String paiement;
  Place adresse;
  bool facture;
  String note;

  CommandeRequest({
    this.paniers = const [],
    required this.clientId,
    required this.prix,
    required this.deliveryCoast,
    required this.paiement,
    required this.adresse,
    required this.facture,
    required this.note,
  });

 Map<String, dynamic> toJson() => {
 
    'paniers': paniers.map((e) => e).toList(),
    'client_id': clientId,
    'prix': prix,
    'delivery_coast': deliveryCoast,
    'paiement': paiement,
    'adresse': adresse.toJson(),
    'facture': facture,
    'note': note
 
};


}