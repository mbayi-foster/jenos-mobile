import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/primary_button.dart';
import 'package:jenos_app/views/components/secondary_button.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            //  padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Découvrez les meilleurs plats de plus de 5000 restaurants et une livraison rapide à votre porte",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54
                ),),
                SizedBox(height: 55),
                PrimaryButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    fontSize: width * 0.04,
                    padding: width * 0.3,
                    title: "Se connecter"),
                SizedBox(height: 25),
                SecondaryButton(
                    onPressed: () {},
                    fontSize: width * 0.04,
                    padding: width * 0.26,
                    title: "Créer un compte")
              ],
            ),
          )
        ],
      ),
    );
  }
}
