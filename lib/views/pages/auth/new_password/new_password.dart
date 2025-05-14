import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  static const String path = '/update-password';
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
                TextTitle(
                    title: LocalisationService.of(context)!
                        .translate("password.title")),
                SizedBox(
                  height: 25,
                ),
                Text(
                  LocalisationService.of(context)!.translate("password.mot"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("password.password"),
                  onSaved: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                MyInput(
                  hint: LocalisationService.of(context)!
                      .translate("password.confirm"),
                  onSaved: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    onPressed: () {
                      Get.toNamed("/otp");
                    },
                    title: LocalisationService.of(context)!
                        .translate("password.btn")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
