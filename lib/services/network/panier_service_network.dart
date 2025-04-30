import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/requets/commande_request.dart';

abstract class PanierServiceNetwork {
  Future<List<Panier>?>? getAll(int userId);
  Future<bool> ajouter(Map<String, dynamic> data);
  Future<bool> retirer(int id);
  Future<bool> commander(CommandeRequest commande);
}
