import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/user.dart';

class CommandesPageState {
  List<Panier> paniers;
  bool loading;
  bool hasData;
  bool visible;
  User? user;

  CommandesPageState(
      {this.paniers = const [],
      this.loading = false,
      this.hasData = false,
      this.user,
      this.visible = false});
}
