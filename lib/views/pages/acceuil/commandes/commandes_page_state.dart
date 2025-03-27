import 'package:jenos_app/models/principals/panier.dart';

class CommandesPageState {
  List<Panier> paniers;
  bool loading;
  bool hasData;
  bool visible;

  CommandesPageState(
      {this.paniers = const [],
      this.loading = false,
      this.hasData = false,
      this.visible = false});
}
