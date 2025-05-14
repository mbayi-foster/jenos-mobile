import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/commandes/suivre_commande/suivre_commande_page_ctrl.dart';

class SuivreCommandePage extends StatefulWidget {
  const SuivreCommandePage({super.key});
  static const String path = '/suivre-commande/:id';

  @override
  State<SuivreCommandePage> createState() => _SuivreCommandePageState();
}

class _SuivreCommandePageState extends State<SuivreCommandePage> {
  SuivreCommandePageCtrl ctrl = Get.put(SuivreCommandePageCtrl());
  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title:
              TextTitle(title: "${state.value.id} Ma commande"),
        ),
      );
    });
  }
}
