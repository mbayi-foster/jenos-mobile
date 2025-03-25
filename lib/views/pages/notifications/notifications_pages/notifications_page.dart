import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Notifications"),
        actions: [const PanierButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity, // S'assure que le conteneur prend toute la largeur
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligne le texte correctement
                  children: [
                    ClipOval(
                      child: Container(
                        color: MyColors.primary,
                        width: 40, // Largeur du cercle
                        height: 40, // Hauteur du cercle
                      ),
                    ),
                    SizedBox(width: 10), // Espace entre l'icône et le texte
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello welcome à la pagenier irnpernuoetng rgjper rjnfiep rjneoi fnioerjg rgnfo gnoi",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Now",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}