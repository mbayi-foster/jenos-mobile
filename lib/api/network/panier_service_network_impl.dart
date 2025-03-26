import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/services/network/panier_service_network.dart';
import 'package:http/http.dart' as http;

class PanierServiceNetworkImpl implements PanierServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  @override
  Future<bool> ajouter(Map<String, dynamic> data) async {
    var url = Uri.parse("${baseUrl}paniers");
    print("data : $data");
    var response = await http.post(url, body: data);
    print("traitement en cours");
    if (response.statusCode == 201) {
      print("succes");
      //  Map<String, dynamic> res = json.decode(response.body);
      return true;
    }
    print("echec");
    return false;
  }

  @override
  Future<List<Panier>>? getAll(int userId) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool> retirer(int id) {
    // TODO: implement retirer
    throw UnimplementedError();
  }
}
