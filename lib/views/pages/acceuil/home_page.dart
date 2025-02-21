import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/cards/offres.dart';
import 'package:jenos_app/views/components/cards/plat_recent.dart';
import 'package:jenos_app/views/components/cards/plats.dart';
import 'package:jenos_app/views/components/cards/plats_pop.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = -1;
  List plats = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Bonjour Rolly !"),
        automaticallyImplyLeading: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const PanierButton()],
      ),
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
            _offres(),
            _platPop(width),
            _platMostPop(width),
            _recents(width)
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _offres() {
    return SizedBox(
      height: 150, // Hauteur fixe pour le ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Offres(
                offre: "items $index",
                tap: () {},
              ),
              const SizedBox(
                width: 25,
              )
            ],
          );
        },
      ),
    );
  }

  _platPop(width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitle(title: "Plats populaire"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Voir tout",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primary),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 16.00,
        ),
        for (var i = 0; i < 5; i++) Plats(tap: () {})
      ],
    );
  }

  _platMostPop(width) {
    double width0 = width * 0.65;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitle(title: "Les plus populaire"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Voir tout",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primary),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 16.00,
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  PlatsPop(
                    fit: BoxFit.cover,
                    heigth: 125,
                    width: width0,
                    offre: "items $index",
                    tap: () {},
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  _recents(width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitle(title: "Récents"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Voir tout",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primary),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 16.00,
        ),
        for (var i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.00),
            child: Column(
              children: [PlatRecent(tap: () {}), const SizedBox(height: 25.00)],
            ),
          ),
      ],
    );
  }
}
