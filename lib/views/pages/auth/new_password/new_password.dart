import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/langues.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/auth/new_password/new_password_ctrl.dart';
import 'package:jenos_app/utils/padding.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  static const String path = '/update-password';
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String? _password;
  final _keyForm = GlobalKey<FormState>();
  NewPasswordCtrl ctrl = Get.put(NewPasswordCtrl());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: TextTitle(title: "password.title".myTr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextTitle(title: "Adresse email: ${state.value.email}"),
                  25.ph,
                  Text(
                    LocalisationService.of(context)!.translate("password.mot"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                 25.ph,
                  MyInput(
                    validator: _validatePassword,
                    isPassword: true,
                    showPassword: state.value.password,
                    showPasswordOnTap: ctrl.showPassword,
                    hint: LocalisationService.of(context)!
                        .translate("password.password"),
                    onSaved: (value) {
                      _password = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  20.ph,
                  MyInput(
                    validator: _validateConfirmPassword,
                    isPassword: true,
                    showPassword: state.value.password,
                    showPasswordOnTap: ctrl.showPassword,
                    hint: LocalisationService.of(context)!
                        .translate("password.confirm"),
                    onSaved: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                 20.ph,
                  PrimaryButton(
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          _keyForm.currentState!.save();
                          ctrl.changePasseword(context, _password!);
                        }
                      },
                      title: LocalisationService.of(context)!
                          .translate("password.btn")),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _password) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  // Fonction de validation du mot de passe
  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Le mot de passe doit avoir au moins 6 caractères';
    }
    _password = value;
    return null;
  }
}
