import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/home/controllers/profile_ctrl.dart';
import 'package:jenos_app/services/settings/localisation_service.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/inputs/input_label.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class ProfilePage extends StatefulWidget {
  final int index;
  const ProfilePage({super.key, this.index = -1});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bool _edit = true;
  final TextEditingController _nomCtrl =
      TextEditingController(text: "Diercy Tshibuabua");
  final TextEditingController _emailCtrl =
      TextEditingController(text: "diercytshibuabua@gmail.com");
  final TextEditingController _phoneCtrl =
      TextEditingController(text: "0998115482");
  final TextEditingController _adresseCtrl =
      TextEditingController(text: "No9A Nzoloko, Limeté");
  final TextEditingController _passwordCtrl =
      TextEditingController(text: "123456");
  final ProfileCtrl ctrl = Get.put(ProfileCtrl());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<ProfileCtrl>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Profile"),
          automaticallyImplyLeading: false,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [const PanierButton()],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _photo(width),
                SizedBox(height: height * 0.03),
                _data(width)
              ],
            ),
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(
          index: 2,
        ),
        floatingActionButton: const MyFloatingButton(
          index: 2,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  _photo(width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconsPath.profile),
        TextButton(
            onPressed: () {},
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
                    "Editer le profile",
                    style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
                        color: MyColors.primary),
                  ),
                ],
              ),
            )),
        TextTitle(title: "Salut Diercy !"),
        TextButton(
            onPressed: () {
              // Get.toNamed("/forget-password");
            },
            child: Text(
              "Se déconnecter",
              style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            )),
      ],
    );
  }

  _data(width) {
    double height = 20;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: Column(
        children: [
          InputLabel(
            edit: _edit,
            validator: (value) {
              return null;
            },
            hint: "Nom",
            label: "Nom",
            size: width * 0.03,
            ctrl: _nomCtrl,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: _edit,
            validator: (value) {
              return null;
            },
            hint: "Email",
            label: "Email",
            size: width * 0.03,
            ctrl: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: _edit,
            validator: (value) {
              return null;
            },
            hint: "Phone",
            label: "Phone",
            size: width * 0.03,
            ctrl: _phoneCtrl,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: height,
          ),
          InputLabel(
            edit: _edit,
            validator: (value) {
              return null;
            },
            hint: "Adresse",
            label: "Adresse",
            size: width * 0.03,
            ctrl: _adresseCtrl,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: height,
          ),
          if (_edit)
            PrimaryButton(
                onPressed: () {},
                title: LocalisationService.of(context)!.translate("btnSave")),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
