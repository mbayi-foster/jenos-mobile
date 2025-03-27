import 'package:jenos_app/models/principals/panier.dart';

abstract class PanierServiceNetwork {
  Future<List<Panier>?>? getAll(int userId);
  Future<bool> ajouter(Map<String, dynamic> data);
  Future<bool> retirer(int id);
  Future<bool> commander(List<int> paniers, int userId);
}
