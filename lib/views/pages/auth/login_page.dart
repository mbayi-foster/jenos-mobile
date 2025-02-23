import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/auth/controllers/login_ctrl.dart';
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
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
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
                  validator: (value) {
                    return null;
                  },
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
                if (!state.loading)
                  PrimaryButton(
                      padding: 23,
                      onPressed: () {
                        String email = _emailCtrl.text;
                        String password = _passwordCtrl.text;
                        ctrl.login(email, password);
                      },
                      title:
                          LocalisationService.of(context)!.translate("btnLog")),
                if (state.error && !state.loading)
                  SizedBox(
                    height: height * 0.025,
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
                  onPressed: () {},
                  icon: Icons.facebook,
                  padding: 20,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                MyIconButton(
                  title: "Google",
                  bg: Colors.red,
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                  padding: 20,
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
      );
    }));
  }
}
