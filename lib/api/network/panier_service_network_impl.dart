import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/commande.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/requets/commande_request.dart';
import 'package:jenos_app/services/network/panier_service_network.dart';
import 'package:http/http.dart' as http;

class PanierServiceNetworkImpl implements PanierServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  @override
  Future<bool> ajouter(Map<String, dynamic> data) async {
    var url = Uri.parse("${baseUrl}paniers");

    var response = await http.post(url, body: data);

    if (response.statusCode == 201) {
      //  Map<String, dynamic> res = json.decode(response.body);
      return true;
    }

    return false;
  }

  @override
  Future<List<Panier>?>? getAll(int userId) async {
    var url = Uri.parse("${baseUrl}paniers/$userId");
    List<Panier> paniers = [];
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      paniers = jsonData.map((json) => Panier.fromJson(json)).toList();
      return paniers;
    }
    return null;
  }

  @override
  Future<bool> retirer(int id) {
    // TODO: implement retirer
    throw UnimplementedError();
  }

  @override
  Future<bool> commander(CommandeRequest commande) async {
    var url = Uri.parse("${baseUrl}commandes");
    var response = await http.post(url,
        headers: {
          'Content-Type':
              'application/json', // Indique que le corps est en JSON
        },
        body: jsonEncode(commande.toJson()));
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Commande>> getAllCommandes(int id) async {
    List<Commande> commandes = [];

    return commandes;
  }
}
