import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/network/acceuil_service_network.dart';
import 'package:http/http.dart' as http;

class AcceuilServiceNetworkImpl extends AcceuilServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";

  @override
  Future<dynamic> home() async {
    var response = null;
    var url = Uri.parse("${baseUrl}mobile-home");
    var res = await http.get(
      url,
    );

    if (res.statusCode == 200) {
      // Décodez la réponse JSON
      final Map<String, dynamic> jsonData = json.decode(res.body);
      response = jsonData;
    } 

    return response;
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
