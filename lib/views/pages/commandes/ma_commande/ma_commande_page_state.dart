import 'package:jenos_app/models/principals/panier.dart';

class MaCommandePageState {
  bool erreur;
  List<Panier> paniers;
  String note;
  double prix;
  double prixTotal;

  MaCommandePageState(
      {this.erreur = false,
      this.paniers = const [],
      this.note = "",
      this.prix = 0.0,
      this.prixTotal = 0.0});
}
