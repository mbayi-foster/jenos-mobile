import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class CommandeItem extends StatefulWidget {
  const CommandeItem({super.key});

  @override
  State<CommandeItem> createState() => _CommandeItemState();
}

class _CommandeItemState extends State<CommandeItem> {
  @override
  Widget build(BuildContext context) {
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
    List<String> items = ['item1', 'item2'];
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
                  'YNTJKK-FJD-EJZOZ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '25 Nov 2025 13:45',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            16.ph,
            // Liste des items
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) {
                return Column(
                  children: [
                    Text(item),
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
                TextTitle(title: "Status",),
                5.ph,
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.primary,
                  ),
               
                  padding: EdgeInsets.all(10),
                  width: 350,
                  child: Center(
                    child: Text(
                      'status',
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
              onPressed: (){},
              title: "Suivre ma commande",
            )
          ],
        ),
      ),
    );
  }
}
