import 'package:jenos_app/models/principals/place.dart';

class SearchAdressPageState {
  List<Place> places;
  bool loading;
  String hasData;

  SearchAdressPageState({this.hasData = "not_yet", this.loading = false, this.places = const []});
}
