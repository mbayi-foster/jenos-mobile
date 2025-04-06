import 'package:jenos_app/models/principals/place.dart';

class ConfigureAdressePageState {
  Place? place;
  bool loading;
  bool isVisible;
  bool hasData;
  List<Place> places;
  ConfigureAdressePageState({
    this.loading = false, 
    this.place,
    this.isVisible = false,
    this.hasData = false,
    this.places = const []});
}
