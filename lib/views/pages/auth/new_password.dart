import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _controller = TextEditingController();
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
                TextTitle(title: "Nouveau mot de passe"),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  "Veillez créer un nouveau mot de passe sur d'au moins 6 caractère",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                MyInput(
                  hint: "Email",
                  ctrl: _controller,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                PrimaryButton(
                    onPressed: () {
                      Get.toNamed("/otp");
                    },
                    padding: 23,
                    title: "Envoyer"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
