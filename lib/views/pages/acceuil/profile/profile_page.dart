import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/pages/acceuil/profile/profile_ctrl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/inputs/input_label.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/my_dialogue.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // bool _edit = true;

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
    TextEditingController adresseCtrl =
        TextEditingController(text: state.value.user?.adresse);
    List<TextEditingController> controllers = [
      nomCtrl,
      emailCtrl,
      phoneCtrl,
      adresseCtrl
    ];
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
                _data(width, edit: state.value.edit, user: state.value.user)
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
                    LocalisationService.of(context)!.translate("profile.edit"),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: MyColors.primary),
                  ),
                ],
              ),
            )),
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

  _data(width, {required bool edit, required User? user}) {
    double height = 20;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: Column(
        children: [
          InputLabel(
            edit: edit,
            validator: (value) {
              return null;
            },
            hint: LocalisationService.of(context)!.translate("inscrire.name"),
            label: LocalisationService.of(context)!.translate("inscrire.name"),
            ctrl: TextEditingController(text: user?.nom),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: edit,
            validator: (value) {
              return null;
            },
            hint:
                LocalisationService.of(context)!.translate("inscrire.prename"),
            label:
                LocalisationService.of(context)!.translate("inscrire.prename"),
            ctrl: TextEditingController(text: user?.prenom),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: edit,
            validator: (value) {
              return null;
            },
            hint: LocalisationService.of(context)!.translate("inscrire.phone"),
            label: LocalisationService.of(context)!.translate("inscrire.phone"),
            ctrl: TextEditingController(text: user?.phone),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: edit,
            validator: (value) {
              return null;
            },
            hint:
                LocalisationService.of(context)!.translate("inscrire.adresse"),
            label:
                LocalisationService.of(context)!.translate("inscrire.adresse"),
            ctrl: TextEditingController(text: user?.adresse),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: height,
          ),
          if (!edit)
            PrimaryButton(
                onPressed: () {},
                title:
                    LocalisationService.of(context)!.translate("profile.btn")),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
