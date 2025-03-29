import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/acceuil/commandes/commandes_page_ctrl.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/my_bottom_navigation_bar.dart';
import 'package:jenos_app/views/components/buttons/my_floating_button.dart';

class CommandesPage extends StatefulWidget {
  const CommandesPage({super.key});

  @override
  State<CommandesPage> createState() => _CommandesPageState();
}

class _CommandesPageState extends State<CommandesPage> {
  CommandesPageCtrl ctrl = Get.put(CommandesPageCtrl());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Mettez à jour l'état ici
    });
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Commandes"),
          automaticallyImplyLeading: false,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [const PanierButton()],
        ),
        body: (state.value.visible)
            ? SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              )
            : Chargement(
                loading: state.value.loading,
                hasData: state.value.hasData,
              ),
        bottomNavigationBar: const MyBottomNavigationBar(index: 1,),
        floatingActionButton: const MyFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
