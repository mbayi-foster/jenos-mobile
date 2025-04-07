import 'package:jenos_app/models/principals/place.dart';

class ConfigureAdressePageState {
  Place? place;
  bool loading;
  bool isVisible;
  bool hasData;
  /* numero de la page precedente */
  int last;
  List<Place> places;
  ConfigureAdressePageState(
      {this.last = 1,
      this.loading = false,
      this.place,
      this.isVisible = false,
      this.hasData = false,
      this.places = const []});
}
