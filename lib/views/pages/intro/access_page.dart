import 'package:flutter/material.dart';
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
                PrimaryButton(
                    onPressed: () {},
                    fontSize: width * 0.06,
                    padding: width * 0.27,
                    title: "Se connecter"),
                SizedBox(height: 25),
                SecondaryButton(
                    onPressed: () {},
                    fontSize: width * 0.06,
                    padding: width * 0.23,
                    title: "Créer un compte")
              ],
            ),
          )
        ],
      ),
    );
  }
}
