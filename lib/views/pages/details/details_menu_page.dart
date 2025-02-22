import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/plat_menu.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class DetailsMenuPage extends StatefulWidget {
  const DetailsMenuPage({super.key});

  @override
  State<DetailsMenuPage> createState() => _DetailsMenuPageState();
}

class _DetailsMenuPageState extends State<DetailsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: TextTitle(title: "Desserts"),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const PanierButton()],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 0,
      ),
      floatingActionButton: const MyFloatingButton(
        index: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 45.00, top: 25, left: 25.00, right: 25.00),
              child: InputSearch(
                size: 22.5,
                tap: () {},
              ),
            ),
            _plats()
          ],
        ),
      ),
    );
  }

  _plats() {
    return Column(
      children: [
        for (var i = 0; i < 4; i++)
          Column(
            children: [
              PlatMenu(
                tap: () {},
                nom: "French Apple pie",
                details: "La mangue douce",
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
      ],
    );
  }
}
