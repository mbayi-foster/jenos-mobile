import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/pages/auth/register/register_page_ctrl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import '../../../components/buttons/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _nom;
  String? _prenom;
  String? _email;
  String? _phone;
  String? _password;
  String? _confirmPassword;

  final _keyForm = GlobalKey<FormState>();
  RegisterPageCtrl ctrl = Get.put(RegisterPageCtrl());

  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: Obx(() {
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
                    title: LocalisationService.of(context)!
                        .translate("inscrire.btn")),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  LocalisationService.of(context)!.translate("inscrire.mot"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.prename"),
                  validator: _validatePrenom,
                  onSaved: (value) {
                    _prenom = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.name"),
                  validator: _validateNom,
                  onSaved: (value) {
                    _nom = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.email"),
                  validator: _validateEmail,
                  onSaved: (value) {
                    _email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.phone"),
                  validator: _validatePhone,
                  onSaved: (value) {
                    _phone = value;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                /* MyInput(
                  hint: "Adresse",
                  onSaved: (value) {
                    _adresse = value;
                  },
                  keyboardType: TextInputType.text,
                ), */
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  showPassword: state.value.showPassword,
                  showPasswordOnTap: () {
                    ctrl.showPassword();
                  },
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.password"),
                  validator: _validatePassword,
                  onSaved: (value) {
                    _password = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyInput(
                  isPassword: true,
                  showPassword: state.value.showPassword,
                  showPasswordOnTap: () {
                    ctrl.showPassword();
                  },
                  validator: _validateConfirmPassword,
                  hint: LocalisationService.of(context)!
                      .translate("inscrire.confirm"),
                  onSaved: (value) {
                    _confirmPassword = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                // if (!state.value.loading)
                PrimaryButton(
                  onPressed: () async {
                    if (_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();
                      //  _showCustomToast(context, "valide");
                      User user = User(
                          id: 0,
                          nom: _nom!,
                          prenom: _prenom!,
                          email: _email!,
                          phone: _phone!);
                      await ctrl.sendData(user, _password!);
                    }
                  },
                  title: LocalisationService.of(context)!
                      .translate("inscrire.btn"),
                ),
                /*  if (state.value.loading)
                  const CircularProgressIndicator(
                    color: MyColors.primary,
                  ), */
                SizedBox(
                  height: height * 0.05,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    child: Text(
                      LocalisationService.of(context)!
                          .translate("inscrire.log"),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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

  String? _validateNom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un nom';
    }
  }

  String? _validatePrenom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un prénom';
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un numéro de téléphone';
    }
    const pattern =
        r'^\+?[0-9]{10,15}$'; // Exemple pour un numéro international
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Veuillez entrer un numéro de téléphone valide';
    }
    return null;
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

  _showCustomToast(BuildContext context, String msg) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100.0, // Position verticale
        left: MediaQuery.of(context).size.width / 2 -
            75, // Centrer horizontalement
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Supprimez l'overlay après quelques secondes
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
