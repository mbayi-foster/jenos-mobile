import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/cards/plats.dart';
import 'package:jenos_app/views/pages/details/menu/details_menu_ctrl.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/plat_menu.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class DetailsMenuPage extends StatefulWidget {
  const DetailsMenuPage({super.key});

  @override
  State<DetailsMenuPage> createState() => _DetailsMenuPageState();
}

class _DetailsMenuPageState extends State<DetailsMenuPage> {
  DetailsMenuCtrl ctrl = Get.put(DetailsMenuCtrl());
  _goPlat(id) {
    Get.toNamed('/plat/$id');
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      final String id = Get.parameters['id'] ?? '0';
      ctrl.fetchData(id);
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            title: TextTitle(title: state.value.menu?.nom ?? ""),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [const PanierButton()],
          ),
          bottomNavigationBar: const MyBottomNavigationBar(
            index: 0,
          ),
          floatingActionButton: const MyFloatingButton(
            index: 0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: state.value.visible
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 45.00, top: 25, left: 25.00, right: 25.00),
                        child: InputSearch(
                          tap: () {},
                        ),
                      ),
                      _plats(plats: state.value.plats)
                    ],
                  ),
                )
              : Chargement(
                  loading: state.value.loading,
                  hasData: state.value.hasData,
                ));
    });
  }

  _plats({required List<Plat>? plats}) {
    return Column(
      children: [
        for (Plat plat in plats!)
          Column(
            children: [
              Plats(
                  tap: () {
                    Get.toNamed('/plat/${plat.id}');
                  },
                  plat: plat),
              // PlatMenu(
              //   tap: () {
              //     _goPlat(plat.id);
              //   },
              //   plat: plat,
              // ),
              10.ph
            ],
          ),
      ],
    );
  }
}
