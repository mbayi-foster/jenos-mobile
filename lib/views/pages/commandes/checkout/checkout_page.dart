import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/buttons/secondary_button.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/inputs/my_dropdown.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
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
    {'type': 'Payer à la livraison', 'value': 'cash'},
    {'type': 'Payer en ligne', 'value': 'carte'},
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
        body: (state.value.isVisible)
            ? SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Adresse de livraison",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
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
                                    onPressed: () {
                                      _dialogCarte(state);
                                    },
                                    child: TextTitle(
                                      title: "Changer",
                                      color: MyColors.primary,
                                    ))
                              ],
                            ),
                          ],
                        ),
                        20.ph,
                        _paiement(state: state),
                        20.ph,
                        _prix(state: state),
                        20.ph,
                        PrimaryButton(
                            onPressed: () async {
                              bool payer = await ctrl.payer(context);
                              if (payer) {
                                Get.offAllNamed('/commandes');
                              } else {
                                Get.defaultDialog(
                                  title: 'Erreur',
                                  middleText:
                                      "Votre adresse de livraison n'est pas prise en charger veillez contacter le service client.",
                                  textConfirm: 'OK',
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      Get.back(); // Fermer la boîte de dialogue
                                    },
                                    child: Text('OK'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors
                                          .primary, // Couleur de fond du bouton
                                    ),
                                  ),
                                );
                              }
                            },
                            title: "Envoyer la commande")
                      ],
                    )),
              )
            : Chargement(
                loading: state.value.loading,
                hasData: state.value.hasData,
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
              )
          ],
        )
      ],
    );
  }

  _prix({required Rx<CheckoutPageState> state}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTitle(title: "Addition"),
            TextTitle(title: "${state.value.prix} FC")
          ],
        ),
        10.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTitle(title: "Frais de livraison"),
            TextTitle(title: "${state.value.deliveryCoast} FC")
          ],
        ),
        10.ph,
        Container(
          height: 0.75,
          color: Colors.black45,
        ),
        10.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTitle(title: "Total"),
            TextTitle(
                title: "${state.value.prix + state.value.deliveryCoast} FC")
          ],
        )
      ],
    );
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

/* changement du lieu */
  _dialogCarte(Rx<CheckoutPageState> state) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SizedBox(
              height: 200,
              width: 400,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          TextTitle(title: "Trouver votre adresse"),
                          const SizedBox(height: 15),
                          PrimaryButton(
                              long: false,
                              onPressed: () {
                                Navigator.of(context).pop();
                                ctrl.navigateToDestination();
                              },
                              title: "Choisir sur la carte"),
                          const SizedBox(
                            height: 10,
                          ),
                          SecondaryButton(
                              long: false,
                              onPressed: () {
                                Navigator.of(context).pop();
                                _dialogueCarteBottom(state);
                              },
                              title: "Entrer au clavier")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

/* changement lieux manuellement */
  _dialogueCarteBottom(Rx<CheckoutPageState> state) {
    String? adresse;
    final keyCarte = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: keyCarte,
                child: Column(
                  children: [
                    TextTitle(title: "Entrez votre adresse complète"),
                    15.ph,
                    MyInput(
                        hint: "Adresse",
                        onSaved: (value) {
                          adresse = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Veillez entrer une adresse";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text),
                    15.ph,
                    MyDropdown(
                        communes: state.value.communes,
                        commune: state.value.commune,
                        onChange: (Commune? newValue) {
                          state.update((val) {
                            val?.commune = newValue;
                          });
                        }),
                    15.ph,
                    PrimaryButton(
                        onPressed: () {
                          if (keyCarte.currentState!.validate()) {
                            keyCarte.currentState!.save();
                            state.update((val) {
                              val?.deliveryCoast = state.value.commune?.frais ?? 0.0;
                              val?.adresse = Place(
                                  nom: adresse,
                                  lat: 0.0,
                                  long: 0.0,
                                  commune: state.value.commune!.nom);
                            });
                            Navigator.pop(context);
                          }
                        },
                        title: "Changer")
                  ],
                ),
              ),
            ),
          );
        });
  }
}
