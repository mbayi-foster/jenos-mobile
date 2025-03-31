import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/info_item.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final List<Map<String, dynamic>> _content = [
    {
      'icon': IconsPath.dollards,
      'text': "more.commandes",
      'lien': "/notifications"
    },
    {
      'icon': IconsPath.dollards,
      'text': "more.inbox",
      'lien': "/notifications"
    },
    {
      'icon': IconsPath.dollards,
      'text': "more.notif",
      'notifications': 20,
      'lien': "/notifications"
    },
    {'icon': IconsPath.dollards, 'text': 'Inbox', 'lien': "/notifications"},
    {
      'icon': IconsPath.dollards,
      'text': "more.about",
      'lien': "/notifications"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: LocalisationService.of(context)!.translate("more.title")),
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
      children: [
        for (var i = 0; i < _content.length; i++)
          Column(children: [
            InfoItem(
              tap: () {
                print("cliqué");
                Get.toNamed(_content[i]['lien']);
              },
              icon: _content[i]['icon']!,
              text: LocalisationService.of(context)!.translate(_content[i]['text']),
              notifications: _content[i]['notifications'] ?? 0,
            ),
            SizedBox(
              height: 25.00,
            )
          ])
      ],
    );
  }
}
