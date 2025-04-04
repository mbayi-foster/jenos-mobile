import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/services/network/localisation_service_network.dart';

class LocalisationServiceNetworkImpl implements LocalisationNetworkService {
  @override
  Future<Place?> getPlace(double lat, double long) async {
    var url = Uri.parse(
        "https://nominatim.openstreetmap.org/reverse?lat=${lat}&lon=${long}&format=json&addressdetails=1");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Place(
          nom: data["display_name"],
          lat: double.parse(data["lat"]),
          long: double.parse(data["lon"]));
    }

    return null;
    /* ry {
      if(response.statusCode)
      return Place()
    } catch (e) {
       // TODO: implement getNamePlace
    throw UnimplementedError();
    } */
  }

  @override
  Future<List<Place>> getPlaces(String nom) async {
    var url = Uri.parse(
        "https://nominatim.openstreetmap.org/search?q=$nom&format=json&addressdetails=1&limit=5");
    var response = await http.get(url);
    List<Place> result = [];

    if (response.statusCode == 200) {
      debugPrint("Suucces " + response.body);
      List<Map<String, dynamic>> data = jsonDecode(response.body);

      data
          .map(
            (p) => result.add(Place(
                nom: p["display_name"],
                lat: double.parse(p["lat"]),
                long: double.parse(p["lon"]))),
          )
          .toList();
    } else {
      debugPrint("Error " + response.body);
    }

    return result;
  }
}
