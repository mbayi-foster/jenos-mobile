import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/commandes/panier_achat/panier_achat_ctrl.dart';
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
    var state = ctrl.state;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Panier d'achat"),
        // ignore: prefer_const_literals_to_create_immutables
        // actions: [const PanierButton()],
      ),
      body: Obx(() {
        if (!state.value.visible) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    children: [
                      PlatPanier(
                        tap: () {
                          print("clique du check");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PlatPanier(
                        tap: () {
                          print("clique du check");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PlatPanier(
                        tap: () {
                          print("clique du check");
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
          );
        }
        return Chargement(
          loading: state.value.loading,
          hasData: state.value.hasData,
        );
      }),
    );
  }
}
