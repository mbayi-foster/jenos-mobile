import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/langues.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/auth/forget_password/forget_password_ctrl.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? _email;
  ForgetPasswordCtrl ctrl = Get.put(ForgetPasswordCtrl());
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
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
                    title: LocalisationService.of(context)!
                        .translate("forget.title"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LocalisationService.of(context)!.translate("forget.mot"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyInput(
                    hint: "forget.email".myTr,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();
                        ctrl.send(_email!, context);
                      }
                    },
                    title: LocalisationService.of(context)!
                        .translate("forget.btn"),
                  ),
                  20.ph,
                  if (state.value.error)
                    Text(
                        "L'adresse email n'a pas été trouvé veillez créer un compte ou contactez le service client"),
                  10.ph,
                  if (state.value.error)
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/register");
                        },
                        child: Text(
                          "login.compte".myTr,
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
        ),
      );
    });
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
}
