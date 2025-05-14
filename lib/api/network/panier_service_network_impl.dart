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
    try {
      var url = Uri.parse("${baseUrl}paniers");

      var response = await http.post(url, body: data);

      //  Map<String, dynamic> res = json.decode(response.body);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Panier>?>? getAll(int userId) async {
    try {
      var url = Uri.parse("${baseUrl}paniers/$userId");
      List<Panier> paniers = [];
      var response = await http.get(
        url,
      );

      List<dynamic> jsonData = json.decode(response.body);
      paniers = jsonData.map((json) => Panier.fromJson(json)).toList();
      return paniers;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> retirer(int id) {
    // TODO: implement retirer
    throw UnimplementedError();
  }

  @override
  Future<bool> commander(CommandeRequest commande) async {
    try {
      var url = Uri.parse("${baseUrl}commandes");
      var response = await http.post(url,
          headers: {
            'Content-Type':
                'application/json', // Indique que le corps est en JSON
          },
          body: jsonEncode(commande.toJson()));

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Commande>> getAllCommandes(int id) async {
    try {
      List<Commande> commandes = [];
      var url = Uri.parse("${baseUrl}commandes/$id");
      var response = await http.get(url);

      List<dynamic> jsonData = json.decode(response.body);
      commandes = jsonData.map((json) => Commande.fromJson(json)).toList();
      return commandes;
    } catch (e) {
      return [];
    }
  }
}
