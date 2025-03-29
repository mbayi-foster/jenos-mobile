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
  double prix;
  List<Panier> checkList;
  PanierAchatState(
      {this.plats = const [],
      this.paniers = const [],
      this.checkList = const [],
      this.loading = false,
      this.hasData = false,
      this.user,
      this.prix = 0.0,
      this.visible = false});

  PanierAchatState copyWith(
          {List<Plat>? plats,
          List<Panier>? paniers,
          bool? loading,
          bool? hasData,
          User? user,
          double? prix,
          List<Panier>? checkList,
          bool? visible}) =>
      PanierAchatState(
        prix: prix ?? this.prix,
        paniers: paniers ?? this.paniers,
        plats: plats ?? this.plats,
        user: user ?? this.user,
        checkList: checkList ?? this.checkList,
        loading: loading ?? this.loading,
        hasData: hasData ?? this.hasData,
        visible: visible ?? this.visible,
      );
}
