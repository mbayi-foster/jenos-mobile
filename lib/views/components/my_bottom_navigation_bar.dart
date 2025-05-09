import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int index;
  const MyBottomNavigationBar({super.key, this.index = -1});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;

    return BottomNavigationBar(
      selectedItemColor: index == -1 ? Colors.blueGrey : MyColors.primary,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 16.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.menu_outlined),
          label: LocalisationService.of(context)!.translate("home.menu"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag_sharp),
          label: LocalisationService.of(context)!.translate("home.commande"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: LocalisationService.of(context)!.translate("home.profile"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.more_vert),
          label: LocalisationService.of(context)!.translate("home.more"),
        ),
      ],
      currentIndex: index == -1 ? 0 : index,
      onTap: (int index) {
        switch (index) {
          case 0:
            Get.toNamed('/menus');
            break;
          case 1:
            Get.toNamed('/commandes');
            break;
          case 2:
            Get.toNamed('/profile');
            break;
          case 3:
            Get.toNamed('/more');
            break;
          default:
            Get.toNamed('/menus');
        }
      },
    );
  }
}
