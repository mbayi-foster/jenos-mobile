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
  String zone;

  CommandeRequest({
    this.paniers = const [],
    required this.clientId,
    required this.prix,
    required this.deliveryCoast,
    required this.paiement,
    required this.adresse,
    required this.facture,
    required this.note,
    required this.zone,
  });

  Map<String, dynamic> toJson() => {
        'paniers': paniers,
        'client_id': clientId,
        'prix': prix,
        'delivery_coast': deliveryCoast,
        'paiement': paiement,
        'adresse': adresse.toJson(),
        'facture': facture,
        'note': note,
        'zone':zone
      };
}
