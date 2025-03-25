import 'package:jenos_app/models/principals/plat.dart';

class PanierAchatState {
  List<Plat> plats;
  bool loading;
  bool hasData;
  bool visible;

  PanierAchatState(
      {this.plats = const [],
      this.loading = false,
      this.hasData = false,
      this.visible = false});

  PanierAchatState copyWith(
          {List<Plat>? plats, bool? loading, bool? hasData, bool? visible}) =>
      PanierAchatState(
        plats: plats ?? this.plats,
        loading: loading ?? this.loading,
        hasData: hasData ?? this.hasData,
        visible: visible ?? this.visible,
      );
}
