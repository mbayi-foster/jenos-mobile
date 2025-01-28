import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/my_input.dart';

import '../../components/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "S'inscrire'",
                  style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  "Ajoutez vos coordonnées pour vous inscrire",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                MyInput(
                  hint: "Nom",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                MyInput(
                  hint: "Email",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                MyInput(
                  hint: "Téléphone",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                MyInput(
                  hint: "Adresse",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                MyInput(
                  hint: "Mot de passe",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                MyInput(
                  hint: "Confirmer mot de passe",
                  size: width * 0.04,
                  ctrl: _passwordCtrl,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                PrimaryButton(
                    onPressed: () {
                      // Get.toNamed("/login");
                    },
                    fontSize: width * 0.04,
                    padding: width * 0.3,
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
