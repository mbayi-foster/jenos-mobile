import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/colors.dart';

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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_outlined),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_sharp),
          label: 'Offres',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: 'More',
        ),
      ],
      currentIndex: index == -1 ? 0 : index,
      onTap: (int index) {
        print("l'index cliqué est : $index");
        switch (index) {
          case 0:
            Get.toNamed('/menu');
            break;
          case 1:
            Get.toNamed('/offres');
            break;
          case 2:
            Get.toNamed('/profile');
            break;
          case 3:
            Get.toNamed('/more');
            break;
          default:
             Get.toNamed('/menu');
        }
      },
    );
  }
}
