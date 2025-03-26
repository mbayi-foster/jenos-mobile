import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';

class PanierAchatState {
  List<Plat> plats;
  bool loading;
  bool hasData;
  bool visible;
  List<Panier> paniers;
  User? user;
  PanierAchatState(
      {this.plats = const [],
      this.paniers = const [],
      this.loading = false,
      this.hasData = false,
      this.user,
      this.visible = false});

  PanierAchatState copyWith(
          {List<Plat>? plats,
          List<Panier>? paniers,
          bool? loading,
          bool? hasData,
          User? user,
          bool? visible}) =>
      PanierAchatState(
        paniers: paniers ?? this.paniers,
        plats: plats ?? this.plats,
        user: user ?? this.user,
        loading: loading ?? this.loading,
        hasData: hasData ?? this.hasData,
        visible: visible ?? this.visible,
      );
}
