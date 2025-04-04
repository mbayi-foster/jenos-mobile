import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/place.dart';

class MyAutoCompleteLocation extends StatefulWidget {
  MyAutoCompleteLocation({
    super.key,
    required this.label,
    this.icon: Icons.location_city,
    required this.onTap,
    this.autoController,
  });

  final String label;
  final IconData icon;
  Function(Place location) onTap;
  TextEditingController? autoController;

  @override
  State<MyAutoCompleteLocation> createState() => _MyAutoCompleteLocationState();
}

class _MyAutoCompleteLocationState extends State<MyAutoCompleteLocation> {
  var key = GlobalKey();
  @override
  @override
  Widget build(BuildContext context) {
    return AsyncAutocomplete<Place>(
      controller: widget.autoController,
      inputKey: key,
      onTapItem: (Place location) {
        widget.onTap(location);
      },
      suggestionBuilder: (data) => ListTile(
        title: Text(data.nom!),
        subtitle: Text(data.nom!),
      ),
      asyncSuggestions: (searchValue) => getResult(searchValue),
      decoration: InputDecoration(
        focusColor: Colors.white,
        suffixIcon: Icon(
          Icons.location_searching_sharp,
        ),
        prefixIcon: Icon(widget.icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),

        hintText: "Entrez une adresse",

        //make hint text
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),

        //create lable
        labelText: widget.label,
        //lable style
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Future<List<Place>> getResult(search) async {
    List<Place> places = [];

    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();

    places = await api.getPlaces(search);

    return places;
  }
}
