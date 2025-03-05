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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: GetBuilder<LoginCtrl>(builder: (ctrl) {
      var state = ctrl.state;
      return Padding(
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
                  validator: (value) {
                    return null;
                  },
                  hint: "Email",
                  onSaved: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  hint: "Mot de passe",
                  onSaved: (value) {},
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!state.loading)
                  PrimaryButton(
                      onPressed: () {
                        /* String email = _emailCtrl.text;
                        String password = _passwordCtrl.text;
                        ctrl.login(email, password); */
                      },
                      title:
                          LocalisationService.of(context)!.translate("btnLog")),
                if (state.error && !state.loading)
                  const SizedBox(
                    height: 20,
                  ),
                if (state.error && !state.loading)
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
                if (ctrl.state.loading)
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
}
