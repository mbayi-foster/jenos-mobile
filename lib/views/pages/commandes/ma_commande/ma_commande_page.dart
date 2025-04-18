import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/langues.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page_ctrl.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page_state.dart';

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
    return Obx(() {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.5)),
                      child: Image.asset(
                        ImagePaths.pizza,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    20.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: 'Jenos Food',
                          fontSize: 20,
                        ),
                        5.ph,
                        Text("Pour vous servire"),
                        5.ph,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: MyColors.primary,
                              size: 17,
                            ),
                            7.5.pw,
                            Text("Adresse")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              30.ph,
              _plats(paniers: state.value.paniers),
              30.ph,
              _prix(state: state),
              30.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  onPressed: () {
                    Get.toNamed('/checkout', arguments: ctrl.commander());
                  },
                  title: LocalisationService.of(context)!
                      .translate("commande.btn"),
                  padding: 23,
                ),
              )
            ],
          ),
        ),
      );
    });
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

  _prix({required Rx<MaCommandePageState> state}) {
    final formKey = GlobalKey<FormState>();
    String? note;
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
                onPressed: () {
                  if (state.value.note.isEmpty) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextTitle(title: "Ajoutez une note"),
                              SizedBox(height: 15),
                              Form(
                                key: formKey,
                                child: MyInput(
                                  ligne: 5,
                                  radius: false,
                                  hint: 'Note',
                                  onSaved: (String? value) {
                                    note = value;
                                  },
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veillez  ajouter une note";
                                    } else if (value.length > 300) {
                                      return "La note ne doit pas depasser 300 caractères";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              PrimaryButton(
                                  long: false,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      ctrl.getNote(note!);

                                      Navigator.pop(context);
                                    }
                                  },
                                  title: LocalisationService.of(context)!
                                      .translate("commande.add")),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    ctrl.retireNote();
                  }
                },
                child: Text(
                  (state.value.note.isEmpty)
                      ? "+ ${LocalisationService.of(context)!.translate("commande.add")}"
                      : "Retirer",
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w400,
                      color: MyColors.primary),
                ),
              ),
            ],
          ),
          if (state.value.note.isNotEmpty)
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 10.00),
              Text(
                state.value.note,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ]),
          const SizedBox(height: 20.00),
          Container(
            height: 0.75,
            color: Colors.black45,
          ),
          20.0.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "commande.tot".myTr,
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
