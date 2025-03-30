import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page_ctrl.dart';

class MaCommandePage extends StatefulWidget {
  const MaCommandePage({super.key});

  @override
  State<MaCommandePage> createState() => _MaCommandePageState();
}

class _MaCommandePageState extends State<MaCommandePage> {
  MaCommandePageCtrl ctrl = Get.put(MaCommandePageCtrl());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    var state = ctrl.state;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(
            title:
                LocalisationService.of(context)!.translate("commande.title")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _plats(paniers: state.value.paniers),
            SizedBox(
              height: 30,
            ),
            _prix(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                onPressed: () {},
                title:
                    LocalisationService.of(context)!.translate("commande.btn"),
                padding: 23,
              ),
            )
          ],
        ),
      ),
    );
  }

  _plats({required List<Panier> paniers}) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(children: [
          for (Panier panier in paniers)
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${panier.plat!.nom}  x${panier.qte}",
                          style: const TextStyle(fontSize: 17.5)),
                      Text(
                        '${panier.prix} FC',
                        style: const TextStyle(
                            fontSize: 17.5, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.00,
                  ),
                  Container(
                    height: 0.75,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    height: 20.00,
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }

  _prix() {
    var state = ctrl.state;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalisationService.of(context)!.translate("commande.note"),
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "+ ${LocalisationService.of(context)!.translate("commande.add")}",
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w400,
                      color: MyColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.00),
          Container(
            height: 0.75,
            color: Colors.black45,
          ),
          SizedBox(height: 20.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalisationService.of(context)!.translate("commande.sub"),
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              Text(
                "${state.value.prix} FC",
                style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: MyColors.primary),
              ),
            ],
          ),
          SizedBox(
            height: 20.00,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalisationService.of(context)!.translate("commande.cost"),
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              Text(
                "${state.value.deliveryPrice} FC",
                style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: MyColors.primary),
              ),
            ],
          ),
          SizedBox(
            height: 20.00,
          ),
          Container(
            height: 1,
            color: Colors.black45,
          ),
          SizedBox(
            height: 20.00,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalisationService.of(context)!.translate("commande.tot"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "${state.value.prixTotal} FC",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
