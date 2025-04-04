import 'dart:async';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/models/principals/user.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    // Démarrer le timer pour changer de page après 10 secondes
    Timer(const Duration(seconds: 5), () async{
      AuthServiceLocalImpl api = AuthServiceLocalImpl();

      User? user = await api.getUser();

      if(user == null){
       
      }else{
         Get.offAllNamed('/home');
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: width * 0.5, child: Image.asset(ImagePaths.logo)),
          const Text(
            "FOOD DELIVERY",
            style: TextStyle(
                fontSize: 16.00,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          )
        ],
      ),
    ));
  }
}
