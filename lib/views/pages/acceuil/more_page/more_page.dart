import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/info_item.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/mores/about_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final List<Map<String, dynamic>> _content = [
    {'icon': IconsPath.dollards, 'text': "Mes commandes", 'lien': "/commandes"},
    {
      'icon': IconsPath.dollards,
      'text': "Notifications",
      'notifications': 20,
      'lien': "/notifications"
    },
    {
      'icon': IconsPath.dollards,
      'text': "Langues",
      'langue': true,
      'lien': "/notifications"
    },
    {
      'icon': IconsPath.dollards,
      'text': "Changer le mot de passe",
      'lien': "/change-password"
    },
    // {'icon': IconsPath.dollards, 'text': 'Inbox', 'lien': "/notifications"},
    {
      'icon': IconsPath.dollards,
      'text': "A propos de nous",
      'lien': AboutPage.path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(
            title: LocalisationService.of(context)!.translate("more.title")),
        automaticallyImplyLeading: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const PanierButton()],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 3,
      ),
      floatingActionButton: const MyFloatingButton(
        index: 3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: _items(),
            )
          ],
        ),
      ),
    );
  }

  _items() {
    return Column(
        children: _content.map((val) {
      return Column(
        children: [
          InfoItem(
            tap: () {
              // print("cliqué");
              if (val.containsKey("langue")) {
                _dialogueChangeLangue();
              } else {
                Get.toNamed(val['lien']);
              }
            },
            icon: val['icon']!,
            text: "${val['text']}",
            notifications: val['notifications'] ?? 0,
          ),
          25.00.ph
        ],
      );
    }).toList());
  }

  _dialogueChangeLangue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextTitle(title: "Choisir la langue de l'application"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ListTile(
                    title: Text('Français'),
                    onTap: () {
                      // Action pour sélectionner le français
                      Navigator.of(context).pop();
                      // _selectLanguage(context, 'Français');
                    },
                  ),
                  ListTile(
                    title: Text('English'),
                    onTap: () {
                      // Action pour sélectionner l'anglais
                      Navigator.of(context).pop();
                      // _selectLanguage(context, 'English');
                    },
                  ),
                  ListTile(
                    title: Text('Español'),
                    onTap: () {
                      // Action pour sélectionner l'espagnol
                      Navigator.of(context).pop();
                      // _selectLanguage(context, 'Español');
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
