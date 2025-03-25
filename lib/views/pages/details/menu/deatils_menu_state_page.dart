import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DeatilsMenuStatePage {
  bool loading;
  bool hasData;
  bool visible;
  Menu? menu;
  List<Plat> plats;

  DeatilsMenuStatePage(
      {this.loading = false,
      this.hasData = false,
      this.visible = false,
      this.menu = null,
      this.plats = const []});
}
