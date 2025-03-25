import 'package:jenos_app/models/principals/menu.dart';

class MenuStatePage {
  bool loading;
  bool hasData;
  bool visible;
  List<Menu> menus;

  MenuStatePage({
    this.loading = false,
    this.hasData = false,
    this.visible = false,
    this.menus = const [],
  });
}
