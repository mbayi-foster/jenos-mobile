import 'package:jenos_app/models/principals/plat.dart';

class HomePageState {
  bool hasData;
  bool loading;
  bool visible;
  List<Plat> platRecents;
  List<Plat> platPops;
  List<Plat> platMostPops;
  HomePageState(
      {this.loading = false,
      this.hasData = false,
      this.visible = false,
      this.platMostPops = const [],
      this.platPops = const [],
      this.platRecents = const []});

  HomePageState copyWith({
    bool? hasData,
    bool? loading,
    bool? visible,
    List<Plat>? platRecents,
    List<Plat>? platPops,
    List<Plat>? platMostPops,
  }) =>
      HomePageState(
          hasData: hasData ?? this.hasData,
          loading: loading ?? this.loading,
          visible: visible ?? this.visible,
          platMostPops: platMostPops ?? this.platMostPops,
          platPops: platPops ?? this.platPops,
          platRecents: platRecents ?? this.platPops);
}
