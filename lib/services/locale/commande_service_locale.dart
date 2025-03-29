import 'package:jenos_app/models/principals/panier.dart';

abstract class CommandeServiceLocale {
  Future<bool> initierCommande(List<Panier> paniers);
}
