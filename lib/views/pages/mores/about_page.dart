import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class AboutPage extends StatelessWidget {
  static String path = "/about-us";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: 'À propos de nous'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notre Mission',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            10.ph,
            Text(
              'Nous nous engageons à fournir les meilleurs services à nos clients. Notre mission est de créer des solutions innovantes qui répondent aux besoins de notre communauté.',
              style: TextStyle(fontSize: 16),
            ),
            20.ph,
            Text(
              'Notre Équipe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            10.ph,
            Text(
              'Notre équipe est composée de professionnels passionnés et expérimentés dans leur domaine. Nous croyons en la collaboration et en l\'innovation pour atteindre nos objectifs.',
              style: TextStyle(fontSize: 16),
            ),
            20.ph,
            Text(
              'Nos Valeurs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            10.ph,
            Text(
              'Nous valorisons l\'intégrité, la transparence et le respect. Ces valeurs guident toutes nos actions et décisions au sein de l\'entreprise.',
              style: TextStyle(fontSize: 16),
            ),
            20.ph,
            Text(
              'Engagement Communautaire',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            10.ph,
            Text(
              'Nous croyons en l\'importance de redonner à la communauté. Nous participons à divers projets et initiatives pour améliorer la vie des personnes qui nous entourent.',
              style: TextStyle(fontSize: 16),
            ),
            30.ph,
            Text(
              'Contactez-nous',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                  onPressed: () {
                    // Action pour WhatsApp
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () {
                    // Action pour Facebook
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.tiktok),
                  onPressed: () {
                    // Action pour TikTok
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.envelope),
                  onPressed: () {
                    // Action pour Email
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
