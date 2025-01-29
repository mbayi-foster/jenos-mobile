import 'package:flutter/material.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/text_title.dart';

class Offres extends StatefulWidget {
  final String offre;
  final GestureTapCallback tap;

  const Offres(
      {super.key,
      required this.offre,
      required this.tap,});

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
                child: Image.asset(
                  ImagePaths.pizza,
                )),
          ),
          Text(
            widget.offre,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
