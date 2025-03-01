import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/cards/plats.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class OffrePage extends StatefulWidget {
  const OffrePage({super.key});

  @override
  State<OffrePage> createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Dernières offres"),
        automaticallyImplyLeading: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const PanierButton()],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 1,
      ),
      floatingActionButton: const MyFloatingButton(
        index: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 35.00, left: 25.00, right: 25.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Trouvez des réductions",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 27.5,
                  ),
                  PrimaryButton(
                    long: false,
                    onPressed: () {},
                    title: 'Vérifier les offres',
                    padding: 12,
                    fontSize: 15,
                  )
                ],
              ),
            ),
          //  _plats()
          ],
        ),
      ),
    );
  }
/* 
  _plats() {
    return Column(
      children: [for (var i = 0; i < 5; i++)  Plats(tap: () {})],
    );
  } */
}
