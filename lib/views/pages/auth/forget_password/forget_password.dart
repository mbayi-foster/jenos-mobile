import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                  hint: LocalisationService.of(context)!
                      .translate("forget.email"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {},
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                PrimaryButton(
                    onPressed: () {
                      Get.toNamed("/otp");
                    },
                    title: LocalisationService.of(context)!
                      .translate("forget.btn"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
