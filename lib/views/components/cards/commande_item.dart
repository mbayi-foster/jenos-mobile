import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/commande.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:intl/intl.dart';

class CommandeItem extends StatefulWidget {
  CommandeItem({super.key, required this.commande});

  Commande commande;

  @override
  State<CommandeItem> createState() => _CommandeItemState();
}

class _CommandeItemState extends State<CommandeItem> {
  @override
  Widget build(BuildContext context) {
    Commande commande = widget.commande;
    String formattedDate =
        DateFormat('dd MMM yyyy HH:mm').format(commande.createdAt);

    Color getColor(String choice) {
      switch (choice) {
        case 'null':
          return Colors.red;
        case 'progress':
          return Colors.green;
        case 'finish':
          return MyColors.primary;
        default:
          return MyColors
              .primary; // Couleur par défaut si aucune correspondance
      }
    }

    String getstatus(String choice) {
      switch (choice) {
        case 'null':
          return "Disponible";
        case 'progress':
          return "En cours";
        case 'finish':
          return "Livré";
        default:
          return "Disponible"; // Couleur par défaut si aucune correspondance
      }
    }

    // return Container(
    //   padding: EdgeInsets.all(5),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           TextTitle(title: "JTIEOOCEUCE"),
    //           Text("25 Nov 2025 13:45")
    //         ],
    //       ),
    //       10.ph
    //     ],
    //   ),
    // );
    return Card(
      elevation: 4, // Élévation pour l'ombre
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Coins arrondis
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre et date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  commande.ticket,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            16.ph,
            // Liste des items
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: commande.paniers.map((item) {
                return Column(
                  children: [
                    Text("${item.plat?.nom} x${item.qte}"),
                    3.ph // Séparateur
                  ],
                );
              }).toList(),
            ),
            16.ph,
            // Statut
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextTitle(
                  title: "Status",
                ),
                5.ph,
                Container(
                  decoration:
                      BoxDecoration(color: getColor(commande.livraison)),
                  padding: EdgeInsets.all(10),
                  width: 350,
                  child: Center(
                    child: Text(
                      getstatus(commande.livraison),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            16.ph,
            // Bouton
            PrimaryButton(
              onPressed: () {},
              title: "Suivre ma commande",
            )
          ],
        ),
      ),
    );
  }
}
