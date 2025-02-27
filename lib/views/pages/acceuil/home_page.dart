import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/controllers/home/controllers/home_ctrl.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/chargement.dart';
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
  HomeCtrl ctrl = Get.put(HomeCtrl());

  // List plats = [1, 2, 3, 4, 5, 6, 7];

  /*  @override
  void initState() {
    super.initState();
    ctrl.fetchData();
  }
 */

  _goPlat(id) {
    Get.toNamed('/plat/$id');
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
      ctrl.fetchData();
    });

    var state = ctrl.state;
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
      body: Obx(() {
        if (state.value.visible) {
          List<Plat> recents = state.value.platRecents;
          List<Plat> platsPop = state.value.platPops;
          List<Plat> mostPops = state.value.platMostPops;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 45.00, top: 25, left: 25.00, right: 25.00),
                  child: InputSearch(
                    tap: () {},
                  ),
                ),
                _offres(),
                _platPop(width, plats: platsPop),
                _platMostPop(width, plats: mostPops),
                _recents(width, plats: recents)
              ],
            ),
          );
        }
        return Chargement(
          loading: state.value.loading,
          hasData: state.value.hasData,
        );
      }),
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
        itemCount: 5,
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

  _platPop(width, {List<Plat> plats = const []}) {
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
        for (Plat plat in plats)
          Plats(
            tap: () {
              _goPlat(plat.id);
            },
            plat: plat,
          )
      ],
    );
  }

  _platMostPop(width, {List<Plat> plats = const []}) {
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
          height: 230,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: plats.length,
            itemBuilder: (context, index) {
              //print("le tableau contient ${plats.length} elements");
              return Row(
                children: [
                  PlatsPop(
                    plat: plats[index],
                    fit: BoxFit.cover,
                    offre: "items $index",
                    tap: () {
                      _goPlat(plats[index].id);
                    },
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

  // ignore: unused_element
  _recents(width, {List<Plat> plats = const []}) {
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
        for (Plat plat in plats)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.00),
            child: Column(
              children: [
                PlatRecent(
                  tap: () {
                    _goPlat(plat.id);
                  },
                  plat: plat,
                ),
                const SizedBox(height: 25.00)
              ],
            ),
          ),
      ],
    );
  }
}
