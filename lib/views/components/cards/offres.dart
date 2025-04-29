import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/utils/images_path.dart';

class Offres extends StatefulWidget {
  final Menu offre;
  final GestureTapCallback tap;

  const Offres({
    super.key,
    required this.offre,
    required this.tap,
  });

  @override
  State<Offres> createState() => _OffresState();
}

class _OffresState extends State<Offres> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Bords arrondis
            ),
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  widget.offre.photo,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      ImagePaths
                          .error, // Remplace par le chemin de ton image de remplacement
                      fit:
                          BoxFit.cover, // Ajustement de l'image de remplacement
                    );
                  },
                )),
          ),
          Text(
            widget.offre.nom,
            style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
