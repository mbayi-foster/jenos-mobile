import 'package:jenos_app/models/principals/menu.dart';

class MenuPageState {
  bool loading;
  bool hasData;
  bool visible;
  List<Menu> menus;

  MenuPageState({
    this.loading = false,
    this.hasData = false,
    this.visible = false,
    this.menus = const [],
  });
}
