import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';

abstract class DetailsServiceNetwork {
  Future<dynamic> getPlat(String id);
  Future<dynamic> getMenu(String id);
}
