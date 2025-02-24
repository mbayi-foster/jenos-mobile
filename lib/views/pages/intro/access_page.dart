import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/services/settings/localisation_service.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/buttons/secondary_button.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            // width: double.infinity,
            child: Image.asset(
              ImagePaths.bg,
              width: width,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Découvrez les meilleurs plats de plus de 5000 restaurants et une livraison rapide à votre porte",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 55),
                    PrimaryButton(
                        onPressed: () {
                          Get.toNamed("/login");
                        },
                        title: LocalisationService.of(context)!
                            .translate("btnLog"),
                        ),
                    const SizedBox(height: 25),
                    SecondaryButton(
                        onPressed: () {
                          Get.toNamed("/register");
                        },
                        title:
                            LocalisationService.of(context)!.translate("reg"))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
