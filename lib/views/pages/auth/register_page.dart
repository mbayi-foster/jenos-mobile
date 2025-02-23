import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/services/settings/localisation_service.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

import '../../components/buttons/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _adresseCtrl = TextEditingController();
  final TextEditingController _passwordVerifyCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.08, horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(
                    title:
                        LocalisationService.of(context)!.translate("btnReg")),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Ajoutez vos coordonnées pour vous inscrire",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyInput(
                  hint: "Nom",
                  size: width * 0.04,
                  ctrl: _nomCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: "Email",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: "Téléphone",
                  size: width * 0.04,
                  ctrl: _phoneCtrl,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: "Adresse",
                  size: width * 0.04,
                  ctrl: _adresseCtrl,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  hint: "Mot de passe",
                  size: width * 0.04,
                  ctrl: _passwordCtrl,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  hint: "Confirmer mot de passe",
                  size: width * 0.04,
                  ctrl: _passwordVerifyCtrl,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                    onPressed: () {
                      // Get.toNamed("/login");
                    },
                    padding: 23,
                    title: "S'inscrire"),
                SizedBox(
                  height: height * 0.05,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    child: Text(
                      "Vous avez déjà un comptes ? Se connecter",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
