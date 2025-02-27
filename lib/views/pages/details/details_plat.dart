import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/details/plat/details_plat_ctrl.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/my_icon_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class DetailsPlat extends StatefulWidget {
  const DetailsPlat({super.key});

  @override
  State<DetailsPlat> createState() => _DetailsPlatState();
}

class _DetailsPlatState extends State<DetailsPlat> {
  DetailsPlatCtrl ctrl = Get.put(DetailsPlatCtrl());
  int _qte = 1;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      final String id = Get.parameters['id'] ?? '0';
      ctrl.getPlat(id);
    });
    var state = ctrl.state;
    /* final String id = Get.parameters['id'] ?? '0';
    print("voici l'id du plat c'est $id"); */
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const MyBottomNavigationBar(
          index: -1,
        ),
        floatingActionButton: const MyFloatingButton(
          index: -1,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(() {
          if (state.value.visible) {
            return Stack(
              children: [
                SizedBox(
                  height: height,
                ),
                _photo(height, state.value.plat?.photo),
                Align(
                  alignment: Alignment.topCenter,
                  child: _appBar(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: height * 0.70,
                    width: double.infinity,
                    child: Container(
                      width: double.infinity,
                      child: _content(
                          plat: state.value.plat, qte: state.value.qte),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: 50,
                    top: height * 0.65,
                    child: _price(height, state.value.plat?.prix, state.value.qte)),
                Positioned(
                  right:
                      15, // Positionné à l'extrême gauche, ajusté pour dépasser
                  top: height * 0.21, // Ajuster la position verticale
                  child: Center(
                    child: Material(
                      elevation: 8, // Élévation pour donner de la profondeur
                      shape: const CircleBorder(), // Forme circulaire
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(300)),
                        child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(
                                10), // Espace autour de l'icône
                            child: Icon(
                              Icons.favorite,
                              color: MyColors.primary,
                              size: 40,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Chargement(
            loading: state.value.loading,
            hasData: state.value.hasData,
          );
        }));
  }

  _photo(height, photo) {
    return SizedBox(
      width: double.infinity, // Prendre toute la largeur
      height: height * 0.3,
      child: Image.network(
        photo,
        fit: BoxFit.cover,
      ),
    );
  }

  _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            const PanierButton(
              colorIcon: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  _content({Plat? plat, int qte = 0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          TextTitle(title: plat!.nom),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset(IconsPath.etoiles1, width: 65),
                Text("4 étoiles", style: TextStyle(color: Colors.red))
              ]),
              Text(
                "FC ${plat.prix}",
                style: TextStyle(fontSize: 27.5, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            plat.details,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(height: 10, color: Colors.black45),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Quantité",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      ctrl.changeQte(false);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.5, vertical: 3),
                      child: const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(color: MyColors.primary, width: 1)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.5, vertical: 2),
                    child: Text(
                      "$qte",
                      style: const TextStyle(
                          fontSize: 17.5,
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      ctrl.changeQte(true);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.5, vertical: 3),
                      child: const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _price(hei, prix, qte) {
    double height = hei * 0.25;
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              width: 150,
              height: height,
              decoration: BoxDecoration(color: MyColors.primary),
            ),
          ),
        ),
        Positioned(
          left: 65,
          right: 30,
          top: hei * 0.02,
          bottom: hei * 0.02,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                bottomLeft: Radius.circular(60),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Prix total",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  Text(
                    "${prix * qte}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.5,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 230,
                    child: MyIconButton(
                        title: "Ajouter au panier",
                        bg: MyColors.primary,
                        onPressed: () {},
                        icon: Icons.shopping_basket,
                        padding: 23),
                  )
                ],
              ),
            ), /* Container(
              width: double.infinity,
              height: height / 1.5,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [Text("Prix total")],
              ),
            ), */
          ),
        ),
        Positioned(
          right: 10, // Positionné à l'extrême gauche, ajusté pour dépasser
          top: (height / 2) - 35, // Ajuster la position verticale
          child: Center(
            child: Material(
              elevation: 4, // Élévation pour donner de la profondeur
              shape: CircleBorder(), // Forme circulaire
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.all(height / 45), // Espace autour de l'icône
                  child: PanierButton(
                    colorIcon: MyColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

/*   _prixTotal(hei) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(300.0),
          bottomLeft: Radius.circular(300.0),
        ),
        child: Container(
          height: height*,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: [Text("Prix total")],
          ),
        ));
  }
 */
}
