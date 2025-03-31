import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page.dart';
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
      ctrl.getAll();
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TextTitle(
                title:
                    LocalisationService.of(context)!.translate("panier.title")),
            actions: [
              TextButton(
                  onPressed: () {
                    ctrl.allCheck();
                  },
                  child: TextTitle(
                      fontSize: 16,
                      title: (state.value.paniers.length ==
                              state.value.checkList.length)
                          ? "${LocalisationService.of(context)!.translate("panier.all")} (${state.value.checkList.length})"
                          : "${LocalisationService.of(context)!.translate("panier.unall")} (${state.value.checkList.length})"))
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              ctrl.getAll();
            },
            color: MyColors.primary,
            backgroundColor: Colors.transparent,
            child: (state.value.visible)
                ? Stack(children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            for (Panier panier in state.value.paniers)
                              Column(
                                children: [
                                  PlatPanier(
                                    isChecked:
                                        (state.value.checkList.contains(panier))
                                            ? true
                                            : false,
                                    panier: panier,
                                    tap: () {
                                      ctrl.check(panier);
                                    },
                                  ),
                                  const SizedBox(
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
                          decoration: const BoxDecoration(
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
                                  "${LocalisationService.of(context)!.translate("panier.tot")} : ${state.value.prix} FC",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                PrimaryButton(
                                  status: (state.value.checkList.isEmpty)
                                      ? false
                                      : true,
                                  onPressed: () {
                                    Get.to(() => const MaCommandePage(),
                                        arguments: ctrl.commander());
                                  },
                                  title: LocalisationService.of(context)!
                                      .translate("btn"),
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
                  ),
          ));
    });
  }
}
