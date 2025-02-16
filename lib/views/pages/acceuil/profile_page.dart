import 'package:flutter/material.dart';
import 'package:jenos_app/services/settings/localisation_service.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/input_label.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/my_floating_button.dart';
import 'package:jenos_app/views/components/my_input.dart';
import 'package:jenos_app/views/components/primary_button.dart';
import 'package:jenos_app/views/components/text_title.dart';

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
  final TextEditingController _phoneCtrl = TextEditingController(text: "0998115482");
  final TextEditingController _adresseCtrl =
      TextEditingController(text: "No9A Nzoloko, Limeté");
  final TextEditingController _passwordCtrl = TextEditingController(text: "123456");
  final TextEditingController _confirmPasswordCtrl =
      TextEditingController(text: "123456");
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Profile"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [_photo(width), _data(width, height)],
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
  }

  _photo(width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconsPath.profile),
        TextButton(
            onPressed: () {
              // Get.toNamed("/forget-password");
            },
            child: SizedBox(
              width: 100,
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
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            )),
      ],
    );
  }

  _data(width, heigh) {
    double height = heigh * 0.02;
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
          InputLabel(
            edit: _edit,
            validator: (value) {
              return null;
            },
            hint: "Mot de passe",
            label: "Mot de passe",
            isPassword: true,
            size: width * 0.03,
            ctrl: _passwordCtrl,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: heigh * 0.035,
          ),
          if (_edit)
            PrimaryButton(
                onPressed: () {},
                fontSize: width * 0.04,
                padding: width * 0.3,
                title: LocalisationService.of(context)!.translate("btnSave")),
          SizedBox(
            height: heigh * 0.045,
          ), /* InputLabel(
            validator: (value) {},
            hint: "Nom",
            label: "Nom",
            size: width * 0.03,
            ctrl: _emailCtrl,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: height ,)
        */
        ],
      ),
    );
  }
}
