import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/buttons/secondary_button.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/pages/acceuil/profile/profile_ctrl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/inputs/input_label.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/popups/my_dialogue.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // bool _edit = true;
  final _keyForm = GlobalKey<FormState>();
  String? _nom;
  String? _prenom;
  String? _phone;
  ProfileCtrl ctrl = Get.put(ProfileCtrl());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ctrl.getUser();
    });
    double width = MediaQuery.of(context).size.width;
    var state = ctrl.state;

    TextEditingController nomCtrl =
        TextEditingController(text: state.value.user?.nom);
    TextEditingController emailCtrl =
        TextEditingController(text: state.value.user?.email);
    TextEditingController phoneCtrl =
        TextEditingController(text: state.value.user?.phone);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(
            title: LocalisationService.of(context)!.translate("profile.title")),
        automaticallyImplyLeading: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const PanierButton()],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _photo(width, user: state.value.user),
                const SizedBox(height: 30),
                _data(
                  width,
                  edit: state.value.edit,
                  user: state.value.user,
                )
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 2,
      ),
      floatingActionButton: const MyFloatingButton(
        index: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _photo(width, {required User? user}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconsPath.profile),
        TextTitle(
            title:
                "${LocalisationService.of(context)!.translate("profile.hi")} ${user!.prenom} !"),
        TextTitle(title: user!.email),
        TextButton(
            onPressed: () {
              MyDialogue dialogue = MyDialogue();
              dialogue.showSignOut(context, oui: () {
                Navigator.of(context).pop();
                ctrl.signOut();
              });
              // ctrl.signOut();
            },
            child: Text(
              LocalisationService.of(context)!.translate("profile.logout"),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            )),
      ],
    );
  }

  _data(
    width, {
    required bool edit,
    required User? user,
  }) {
    double height = 15;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextTitle(
                title: LocalisationService.of(context)!
                    .translate("inscrire.adresse")),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextTitle(
                    title: (user!.adresse!.nom!.isNotEmpty)
                        ? user.adresse!.nom!
                        : "Aucune adresse enregistrée, cliquez sur changer pour enregistrer une adresse.",
                    maxLines: 4, // Limitez le nombre de lignes si nécessaire
                    overflow: TextOverflow.ellipsis,
                    fontSize:
                        15, // Ajoutez des ellipses si le texte est trop long
                  ),
                ),
                const SizedBox(
                    width: 15), // Ajoutez un espace entre le texte et le bouton
                TextButton(
                  onPressed: () {
                    _dialogCarte();
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Changer",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: MyColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
          Form(
            key: _keyForm,
            child: Column(
              children: [
                SizedBox(
                  height: height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextTitle(title: "Mon profile"),
                    TextButton(
                        onPressed: () {
                          ctrl.edit();
                        },
                        child: SizedBox(
                          width: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit,
                                color: MyColors.primary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                LocalisationService.of(context)!
                                    .translate("profile.edit"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.primary),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLabel(
                  onSaved: (value) {
                    _nom = value;
                  },
                  edit: edit,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veillez entrer un nom";
                    }
                    return null;
                  },
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.name"),
                  label: LocalisationService.of(context)!
                      .translate("inscrire.name"),
                  ctrl: TextEditingController(text: user.nom),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height,
                ),
                InputLabel(
                  onSaved: (p0) {
                    _prenom = p0;
                  },
                  edit: edit,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veillez entrer un prénom";
                    }
                    return null;
                  },
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.prename"),
                  label: LocalisationService.of(context)!
                      .translate("inscrire.prename"),
                  ctrl: TextEditingController(text: user.prenom),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height,
                ),
                InputLabel(
                  onSaved: (p0) {
                    _phone = p0;
                  },
                  edit: edit,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veillez entrer un numéro de téléphone";
                    }
                    return null;
                  },
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.phone"),
                  label: LocalisationService.of(context)!
                      .translate("inscrire.phone"),
                  ctrl: TextEditingController(text: user.phone),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: height,
                ),
                if (!edit)
                  PrimaryButton(
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          _keyForm.currentState!.save();
                          ctrl.updateUser(_nom!, _prenom!, _phone!, context);
                        }
                      },
                      title: LocalisationService.of(context)!
                          .translate("profile.btn")),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

/* popup pour le choix de l'adresse */
  _dialogCarte() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SizedBox(
              height: 170,
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
                                Get.toNamed("/change-adresse");
                              },
                              title: "Choisir sur la carte"),
                          const SizedBox(
                            height: 10,
                          ),
                          SecondaryButton(
                              long: false,
                              onPressed: () {
                                Navigator.of(context).pop();
                                _dialogueCarteBottom();
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

  _dialogueCarteBottom() {
    String? adresse;
    final keyCarte = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Form(
                key: keyCarte,
                child: Column(
                  children: [
                    TextTitle(title: "Entrez votre adresse complète"),
                    SizedBox(
                      height: 15,
                    ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                        onPressed: () {
                          if (keyCarte.currentState!.validate()) {
                            keyCarte.currentState!.save();
                            ctrl.changerAdresse(
                                Place(nom: adresse, lat: 0.0, long: 0.0),
                                context);
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
