import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/inputs/input_location_search.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';
import 'package:jenos_app/views/pages/maps/search/search_adress_page.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_ctrl.dart';

class ConfigureAdressePage extends StatefulWidget {
  const ConfigureAdressePage({super.key});

  @override
  State<ConfigureAdressePage> createState() => _ConfigureAdressePageState();
}

class _ConfigureAdressePageState extends State<ConfigureAdressePage> {
  ConfigureAdressePageCtrl ctrl = Get.put(ConfigureAdressePageCtrl());
  final mapController = MapController();
  late var localisation;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Mettez à jour l'état ici
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Choisir une adresse"),
        ),
        body: Stack(
          children: [
            _carte(state: state),
            /* Champ de recherches */
            if (!state.value.isVisible)
              Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: InputLocationSearch(
                    tap: () {
                      //_searchPlace(height, state: state);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchAdressPage()),
                      );
                    },
                  )),
            /* Bouton flottant */
            Positioned(
                bottom: 140,
                right: 20,
                child: ClipRRect(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.center_focus_strong),
                        ),
                        const SizedBox(height: 10),
                        FloatingActionButton(
                          onPressed: () async {
                            bool position = await ctrl.getCurrentLocation();
                            if (position) {
                              mapController.move(
                                  LatLng(state.value.place!.lat!,
                                      state.value.place!.long!),
                                  17);
                            }

                            if (!state.value.loading) {}
                          },
                          child: Icon(Icons.my_location),
                        ),
                      ],
                    ),
                  ),
                )),
            /* voir le lieu */
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 130,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        color: MyColors.primary,
                      ),
                      TextTitle(
                          title: (state.value.place!.nom == null)
                              ? "Adresse"
                              : state.value.place!.nom!),
                      const SizedBox(
                        height: 5,
                      ),
                      PrimaryButton(
                          long: false,
                          onPressed: () {
                            ctrl.charger(state.value.place);
                          },
                          title: "Changer")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Marker buildPin(LatLng point, Widget icon) => Marker(
        point: point,
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tapped existing marker'),
              duration: Duration(milliseconds: 1),
              showCloseIcon: true,
            ),
          ),
          child: icon,
        ),
      );

  _carte({required Rx<ConfigureAdressePageState> state}) {
    localisation = buildPin(
        LatLng(state.value.place!.lat ?? 0.0, state.value.place!.long ?? 0.0),
        const Icon(Icons.location_pin, size: 60, color: MyColors.primary));
    return Flexible(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          onTap: (tapPosition, p) async {
            ctrl.changeLocalisation(lat: p.latitude, long: p.longitude);
            // print("Lieu : ${tapPosition.}");
          },
          initialCenter:
              LatLng(state.value.place!.lat!, state.value.place!.long!),
          initialZoom: 17,
          maxZoom: 25,
          minZoom: 3,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: <Marker>[localisation],
            rotate: false,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  /*modal pour chercher les places par nom */
/*   _searchPlace(double height, {required Rx<ConfigureAdressePageState> state}) {
    state.update((val) {
      val?.isVisible = true;
    });
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: height * 0.85,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InputLocationSearch(
                    onChange: (value) {
                      if (value.length >= 3) {
                        ctrl.searchPlaces(value);
                      }
                    },
                    readOnly: false,
                    autoFocus: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if(state.value.loading)
                        CircularProgressIndicator(color: MyColors.primary,),
                        if(!state.value.loading && state.value.hasData)
                        for (Place place in state.value.places)
                          Text("${place.nom}")
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).whenComplete(() {
      state.update((val) {
        val?.isVisible = false;
      });
    });
  }
 */
}
