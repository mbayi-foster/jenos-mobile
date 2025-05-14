import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/pages/auth/otp/otp_ctrl.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/inputs/my_input.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? _code;
  final _keyForm = GlobalKey<FormState>();
  OtpCtrl ctrl = Get.put(OtpCtrl());

  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    return Scaffold(body: Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(
                    title: LocalisationService.of(context)!
                        .translate("opt.title")),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LocalisationService.of(context)!.translate("opt.mot"),
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
                  hint: "OTP",
                  onSaved: (value) {
                    _code = value;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!state.value.loading)
                  PrimaryButton(
                      onPressed: () {
                        _keyForm.currentState!.save();
                        int code = int.parse(_code ?? '0');
                        if (state.value.lastPage == 'register') {
                          ctrl.checkOtp(code);
                        } else {
                          ctrl.check(code);
                        }
                      },
                      title: LocalisationService.of(context)!
                          .translate("opt.btn")),
                if (state.value.loading)
                  const CircularProgressIndicator(
                    color: MyColors.primary,
                  ),
                20.ph,
                if (state.value.error) Text("Code incorrect"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      LocalisationService.of(context)!.translate("opt.not"),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(137, 142, 117, 117)),
                    )),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
