import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';

class HomePageState {
  bool hasData;
  bool loading;
  bool visible;
  List<Plat> platRecents;
  List<Plat> platPops;
  List<Plat> platMostPops;
  List<Menu> menus;
  User? user;
  HomePageState(
      {this.loading = false,
      this.hasData = false,
      this.visible = false,
      this.platMostPops = const [],
      this.platPops = const [],
      this.platRecents = const [],
      this.user,
      this.menus = const []
      });

  HomePageState copyWith({
    bool? hasData,
    bool? loading,
    bool? visible,
    List<Plat>? platRecents,
    List<Plat>? platPops,
    List<Plat>? platMostPops,
    User? user
  }) =>
      HomePageState(
          hasData: hasData ?? this.hasData,
          loading: loading ?? this.loading,
          visible: visible ?? this.visible,
          platMostPops: platMostPops ?? this.platMostPops,
          platPops: platPops ?? this.platPops,
          platRecents: platRecents ?? this.platPops,
          user: user ?? this.user
          );
}
