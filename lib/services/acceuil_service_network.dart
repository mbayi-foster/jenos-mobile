import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';

abstract class AcceuilServiceNetwork {
  Future<dynamic> home();
  Future<List<Menu>?> menu();
  Future<List<Plat>?> platPops();
  Future<List<Plat>?> platMostPops();
  Future<List<Plat>?> platRecents();
  Future<List<Plat>?> platByMenu(int menuId);
  Future<List<Plat>?> platByOffres(int menuId);
  Future<User?> profile(int id);
  Future<List<Plat>?> recherchePlats(String motClef);
}
