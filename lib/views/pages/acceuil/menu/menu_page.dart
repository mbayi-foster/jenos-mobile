import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/pages/acceuil/menu/menu_page_ctrl.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/menu_item.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuPageCtrl ctrl = Get.put(MenuPageCtrl());

  _goMenu(id) {
    Get.toNamed('/menu/$id');
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      ctrl.fetchData();
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TextTitle(title: "Menus"),
            automaticallyImplyLeading: false,
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
              ? Stack(
                  children: [
                    // Partie blanche
                    Container(
                      color: Colors.white,
                    ),
                    // Partie orange
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        child: Container(
                          width: 120, // 70% de la largeur
                          height: MediaQuery.of(context).size.height *
                              0.63, // 70% de la hauteur
                          color: MyColors.primary,
                        ),
                      ),
                    ),
                    // Contenu
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 45.00,
                                top: 25,
                                left: 25.00,
                                right: 25.00),
                            child: InputSearch(
                              tap: () {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.00),
                            child: _menu(menus: state.value.menus),
                          ),
                          SizedBox(
                            height: 25.00,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Chargement(
                  loading: state.value.loading,
                  hasData: state.value.hasData,
                ));
    });
  }

  _menu({required List<Menu>? menus}) {
    return Column(
      children: [
        for (Menu menu in menus!)
          Column(
            children: [
              MenuItem(
                tap: () {
                  _goMenu(menu.id);
                },
                image: ImagePaths.pizza,
                menu: menu,
              ),
              const SizedBox(
                height: 25.00,
              )
            ],
          )
      ],
    );
  }
}
