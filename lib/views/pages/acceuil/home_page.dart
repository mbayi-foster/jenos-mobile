import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/views/components/input_search.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/my_floating_button.dart';
import 'package:jenos_app/views/components/offres.dart';
import 'package:jenos_app/views/components/plat_recent.dart';
import 'package:jenos_app/views/components/plats.dart';
import 'package:jenos_app/views/components/plats_pop.dart';
import 'package:jenos_app/views/components/text_title.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextTitle(title: "Bonjour Rolly !"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.075),
              child: InputSearch(
                size: width * 0.04,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
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
