import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/acceuil_service_network.dart';

class AcceuilServiceNetworkImpl extends AcceuilServiceNetwork {
  @override
  Future home() {
    // TODO: implement home
    throw UnimplementedError();
  }

  @override
  Future<List<Menu>?> menu() {
    // TODO: implement menu
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> platByMenu(int menuId) {
    // TODO: implement platByMenu
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> platByOffres(int menuId) {
    // TODO: implement platByOffres
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> platMostPops() {
    // TODO: implement platMostPops
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> platPops() {
    // TODO: implement platPops
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> platRecents() {
    // TODO: implement platRecents
    throw UnimplementedError();
  }

  @override
  Future<User?> profile(int id) {
    // TODO: implement profile
    throw UnimplementedError();
  }

  @override
  Future<List<Plat>?> recherchePlats(String motClef) {
    // TODO: implement recherchePlats
    throw UnimplementedError();
  }
}
