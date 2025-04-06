import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/models/principals/user.dart';

abstract class LocalisationNetworkService {
  Future<Place?> getPlace(double lat, double long);
  Future<List<Place>> searchPlaces(String nom);
  Future<User?> changeAdresse(Place place, int userID);
}
