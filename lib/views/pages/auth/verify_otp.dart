import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/my_input.dart';
import 'package:jenos_app/views/components/primary_button.dart';
import 'package:jenos_app/views/components/text_title.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                TextTitle(title: "Vérification OTP"),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  "Veillez saisir votre adresse email pour recevoir un code afin de créer un nouveau mot de passe",
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
                  hint: "OTP",
                  size: width * 0.04,
                  ctrl: _controller,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                PrimaryButton(
                    onPressed: () {
                      Get.toNamed("/new-password");
                    },
                    fontSize: width * 0.04,
                    padding: width * 0.3,
                    title: "Suivant"),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Renvoyez le code",
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
