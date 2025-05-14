import 'package:flutter/material.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class SuivreCommandePage extends StatefulWidget {
  const SuivreCommandePage({super.key});

  @override
  State<SuivreCommandePage> createState() => _SuivreCommandePageState();
}

class _SuivreCommandePageState extends State<SuivreCommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextTitle(title: "Ma commande"),
      ),
    );
  }
}
