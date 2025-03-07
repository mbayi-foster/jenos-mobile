import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/auth/login/login_ctrl.dart';
import 'package:jenos_app/services/settings/localisation_service.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/my_icon_button.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

import '../../components/buttons/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String? _email;
  late String? _password;
  final _keyForm = GlobalKey<FormState>();
  final LoginCtrl ctrl = Get.put(LoginCtrl());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var state = ctrl.state;
    return Scaffold(body: Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(
                    title:
                        LocalisationService.of(context)!.translate("btnLog")),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ajoutez vos coordonnées pour vous connecter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  validator: _validateEmail,
                  hint: "Email",
                  onSaved: (value) {
                    _email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  validator: _validatePassword,
                  hint: "Mot de passe",
                  onSaved: (value) {
                    _password = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!state.value.loading)
                  PrimaryButton(
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          _keyForm.currentState!.save();
                          ctrl.login(_email!, _password!);
                        }
                      },
                      title:
                          LocalisationService.of(context)!.translate("btnLog")),
                if (state.value.error && !state.value.loading)
                  const SizedBox(
                    height: 20,
                  ),
                if (state.value.error && !state.value.loading)
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
                if (state.value.loading)
                  const CircularProgressIndicator(
                    color: MyColors.primary,
                  ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ou connecter vous avec",
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyIconButton(
                  title: "Facebook",
                  bg: Colors.blue,
                  onPressed: () {},
                  icon: Icons.facebook,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyIconButton(
                  title: "Google",
                  bg: Colors.red,
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/register");
                    },
                    child: Text(
                      "Vous n'avez pas des comptes, inscrivez vous!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    )),
              ],
            ),
          ),
        ),
      );
    }));
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une adresse email';
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Veuillez entrer une adresse email valide';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Le mot de passe doit avoir au moins 6 caractères';
    }
    _password = value;
    return null;
  }
}
