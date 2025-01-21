import 'package:flutter/material.dart';
import 'package:jenos_app/utils/images_path.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(ImagePaths.logo), 
        SizedBox(height: 15.00,),
        Text(
            "FOOD DELIVERY",
            style: TextStyle(
                fontSize: 30.00,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          )],
      ),
    ));
  }
}
