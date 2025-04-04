import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/inputs/my_auto_complete_location.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';
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

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      ctrl.getCurrentLocation();
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
            Positioned(
                bottom: 20,
                left: 20,
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
                          onPressed: () {},
                          child: Icon(Icons.my_location),
                        ),
                      ],
                    ),
                  ),
                )),
            /* Positioned(
                child: ClipRRect(
                    child: Container(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Expanded(
                  child: Column(
                    children: [
                      MyAutoCompleteLocation(label: "label", onTap: (location) {})
                    ],
                  ),
                ),
              ),
            ))) */
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
            SnackBar(
              content: Text('Tapped existing marker'),
              duration: Duration(seconds: 1),
              showCloseIcon: true,
            ),
          ),
          child: icon,
        ),
      );

  _carte({required Rx<ConfigureAdressePageState> state}) {
    late var localisation = buildPin(
        LatLng(state.value.place!.lat ?? 0.0, state.value.place!.long ?? 0.0),
        Icon(Icons.location_pin, size: 60, color: MyColors.primary));
    return Flexible(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          onTap: (tapPosition, p) async {
            ctrl.changeLocalisation(lat: p.latitude, long: p.longitude);
            // print("Lieu : ${tapPosition.}");
          },
          initialCenter: LatLng(
              state.value.place!.lat ?? 0.0, state.value.place!.long ?? 0.0),
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
}
