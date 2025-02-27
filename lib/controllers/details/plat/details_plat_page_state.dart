import 'package:get/utils.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DetailsPlatPageState {
  bool loading;
  bool hasData;
  bool visible;
  Plat? plat;
  int qte;
  DetailsPlatPageState(
      {this.loading = false,
      this.hasData = false,
      this.visible = false,
      this.qte = 1,
      this.plat});

  DetailsPlatPageState copyWith({
    bool? loading,
    bool? hasData,
    bool? visible,
    Plat? plat,
    int? qte
  }) =>
      DetailsPlatPageState(
          loading: loading ?? this.loading,
          hasData: hasData ?? this.hasData,
          visible: visible ?? this.visible,
          plat: plat ?? this.plat,
          qte: qte ?? this.qte);
}
