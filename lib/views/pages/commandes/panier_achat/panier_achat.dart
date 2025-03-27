import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/pages/commandes/panier_achat/panier_achat_ctrl.dart';
import 'package:jenos_app/views/components/cards/plat_panier.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class PanierAchat extends StatefulWidget {
  const PanierAchat({super.key});

  @override
  State<PanierAchat> createState() => _PanierAchatState();
}

class _PanierAchatState extends State<PanierAchat> {
  PanierAchatCtrl ctrl = Get.put(PanierAchatCtrl());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      // ctrl.getUser();
      // Future.delayed(Duration(seconds: ));
      ctrl.getAll();
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Panier d'achat"),
          actions: [
            TextButton(
                onPressed: () {
                  ctrl.allCheck();
                },
                child: Text(
                  (state.value.paniers.length == state.value.checkList.length)
                      ? "Tous deselectionner (${state.value.checkList.length})"
                      : "Tout selectionner (${state.value.checkList.length})",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        body: (state.value.visible) ?
             Stack(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      for (Panier panier in state.value.paniers)
                        Column(
                          children: [
                            PlatPanier(
                              isChecked:
                                  (state.value.checkList.contains(panier.id))
                                      ? true
                                      : false,
                              panier: panier,
                              tap: () {
                                ctrl.check(panier);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Couleur de fond
                      /*  border: Border(
                     op: BorderSide(
                        color: Colors.black, // Couleur de la bordure
                        width: 0.5, // Épaisseur de la bordure
                      ),
                    ), */
                      boxShadow: [
                        BoxShadow(
                          color:
                              // ignore: deprecated_member_use
                              Colors.black45, // Couleur de l'ombre
                          spreadRadius: 2, // Rayon de propagation
                          blurRadius: 5, // Flou de l'ombre
                          offset: Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${state.value.prix} FC",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold),
                          ),
                          PrimaryButton(
                            onPressed: () {},
                            title: "Commander",
                            long: false,
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                  ))
            ])
          : Chargement(
            loading: state.value.loading,
            hasData: state.value.hasData,
          )
      );
    });
  }
}
