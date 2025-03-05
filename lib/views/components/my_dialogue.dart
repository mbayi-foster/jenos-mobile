import 'package:flutter/material.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class MyDialogue {
  void showSignOut(BuildContext context, {required VoidCallback oui}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextTitle(title: "Se déconnecter"),
          content: Text("Voulez-vous vraiment vous déconnecter ?"),
          actions: [
            TextButton(
              onPressed: oui,
              child: Text("Oui", style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: Text("Non", style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );
  }
}
