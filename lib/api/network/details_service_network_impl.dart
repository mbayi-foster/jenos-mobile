import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/services/network/details_service_network.dart';
import 'package:http/http.dart' as http;

class DetailsServiceNetworkImpl implements DetailsServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";

  @override
  Future<Menu?> getMenu(String id) async {
    try {
      var url = Uri.parse("${baseUrl}mobile-menu/$id");
      var res = await http.get(
        url,
      );

      if (res.statusCode == 200) {
        // Décodez la réponse JSON
        Map<String, dynamic> response = json.decode(res.body);
        Menu menu = Menu.fromJson(response);
        return menu;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> getPlat(String id) async {
    try {
      var url = Uri.parse("${baseUrl}mobile-plat/$id");
      var res = await http.get(
        url,
      );

      if (res.statusCode == 200) {
        // Décodez la réponse JSON
        Map<String, dynamic> response = json.decode(res.body);

        return response;
      }
    } catch (e) {
      return null;
    }
  }
}
