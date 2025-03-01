import 'package:get/utils.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DetailsPlatPageState {
  bool loading;
  bool hasData;
  bool visible;
  Plat? plat;
  int qte;
  double prix;
  DetailsPlatPageState(
      {this.loading = false,
      this.hasData = false,
      this.visible = false,
      this.qte = 1,
      this.prix = 0,
      this.plat});

  DetailsPlatPageState copyWith({
    bool? loading,
    bool? hasData,
    bool? visible,
    Plat? plat,
    int? qte,
    double? prix,
  }) =>
      DetailsPlatPageState(
          loading: loading ?? this.loading,
          hasData: hasData ?? this.hasData,
          visible: visible ?? this.visible,
          plat: plat ?? this.plat,
          qte: qte ?? this.qte,
          prix: prix ?? this.prix);
}
