import 'package:jenos_app/models/principals/commande.dart';
import 'package:jenos_app/models/principals/user.dart';

class CommandesPageState {
  List<Commande> commandes;
  bool loading;
  bool hasData;
  bool visible;
  User? user;

  CommandesPageState(
      {this.commandes = const [],
      this.loading = false,
      this.hasData = false,
      this.user,
      this.visible = false});
}
