import 'package:jenos_app/models/principals/place.dart';

abstract class LocalisationNetworkService {
  Future<Place?> getPlace(double lat, double long);
  Future<List<Place>> getPlaces(String nom);
}
