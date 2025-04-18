import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_ctrl.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_state.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CheckoutPageCtrl ctrl = Get.put(CheckoutPageCtrl());
  List<Map<String, dynamic>> typePaiement = [
    {'type': 'Paiement à la livraison', 'value': 'cash'},
    {'type': 'Banque', 'value': 'bank'},
    {'type': 'Mobile money', 'value': 'mobil'},
    {'type': 'Carte', 'value': 'carte'},
    {'type': 'Paypal', 'value': 'paypal'},
  ];
  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: 'Checkout'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adresse de livraison",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    13.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Expanded(
                            child: TextTitle(
                              title: (state.value.adresse == null &&
                                      state.value.user != null)
                                  ? "${(state.value.user?.adresse != null) ? state.value.adresse?.nom : "Aucune adresse trouvée"}"
                                  : "${(state.value.adresse != null) ? state.value.adresse?.nom : "Aucune adresse trouvée"}",
                              maxLines:
                                  4, // Limitez le nombre de lignes si nécessaire
                              overflow: TextOverflow.ellipsis,
                              fontSize:
                                  15, // Ajoutez des ellipses si le texte est trop long
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: TextTitle(
                              title: "Changer",
                              color: MyColors.primary,
                            ))
                      ],
                    ),
                  ],
                ),
                20.ph,
                _paiement(state: state)
              ],
            ),
          ),
        ),
      );
    });
  }

  _paiement({required Rx<CheckoutPageState> state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Méthode de paiement",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        12.ph,
        Column(
          children: <Widget>[
            for (var type in typePaiement)
              Column(
                children: [
                  _radioButton(
                      title: type["type"],
                      value: type['value'],
                      groupeValue: state.value.paiement,
                      onChange: (String? v) {
                        ctrl.changePaiement(type['value']);
                      }),
                  10.ph
                ],
              ),
            Text('Valeur sélectionnée: ${state.value.paiement}'),
          ],
        )
      ],
    );
  }

  _prix({required Rx<CheckoutPageState> state}) {
    return Column();
  }

  _radioButton({
    required String title,
    required String groupeValue,
    required String value,
    required ValueChanged<String?> onChange,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
        child: Card(
          color: const Color.fromARGB(82, 252, 250, 179),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13),
                ),
                Radio<String>(
                  activeColor: MyColors.primary,
                  hoverColor: MyColors.primary,
                  value: value,
                  groupValue: groupeValue,
                  onChanged: onChange,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
