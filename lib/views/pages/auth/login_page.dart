import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/my_icon_button.dart';
import 'package:jenos_app/views/components/my_input.dart';
import 'package:jenos_app/views/components/text_title.dart';

import '../../components/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                TextTitle(title: "Se connecter"),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  "Ajoutez vos coordonnées pour vous connecter",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                MyInput(
                  validator: (value) {},
                  hint: "Email",
                  size: width * 0.04,
                  ctrl: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                MyInput(
                  isPassword: true,
                  hint: "Mot de passe",
                  size: width * 0.04,
                  ctrl: _passwordCtrl,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                PrimaryButton(
                    onPressed: () {
                      String email = _emailCtrl.text;
                      String pasword = _passwordCtrl.text;
                      if (email == "rolly@gmail.com" && pasword == "123456") {
                         Get.toNamed("/home");
                      }
                     
                    },
                    fontSize: width * 0.04,
                    padding: width * 0.3,
                    title: "Se connecter"),
                SizedBox(
                  height: height * 0.025,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/forget-password");
                    },
                    child: Text(
                      "Mot de passe oublié",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Ou connecter vous avec",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                MyIconButton(
                  title: "Facebook",
                  bg: Colors.blue,
                  fontSize: width * 0.04,
                  padding: width * 0.25,
                  onPressed: () {},
                  icon: Icons.facebook,
                  sizeLabel: 30,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                MyIconButton(
                  title: "Google",
                  bg: Colors.red,
                  fontSize: width * 0.04,
                  padding: width * 0.26,
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                  sizeLabel: 30,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/register");
                    },
                    child: Text(
                      "Vous n'avez pas des comptes, inscrivez vous!",
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
