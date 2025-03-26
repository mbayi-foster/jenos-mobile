import 'package:get/utils.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';

class DetailsPlatPageState {
  bool loading;
  bool traitement;
  bool hasData;
  bool visible;
  Plat? plat;
  User? user;
  int qte;
  double prix;
  DetailsPlatPageState(
      {this.loading = false,
      this.traitement = false,
      this.hasData = false,
      this.visible = false,
      this.qte = 1,
      this.prix = 0,
      this.plat,
      this.user});

  DetailsPlatPageState copyWith({
    bool? loading,
    bool? traitement,
    bool? hasData,
    bool? visible,
    Plat? plat,
    User? user,
    int? qte,
    double? prix,
  }) =>
      DetailsPlatPageState(
          loading: loading ?? this.loading,
          traitement: traitement ?? this.traitement,
          hasData: hasData ?? this.hasData,
          visible: visible ?? this.visible,
          plat: plat ?? this.plat,
          user: user ?? this.user,
          qte: qte ?? this.qte,
          prix: prix ?? this.prix);
}
