import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';

class PlatMenu extends StatefulWidget {
  final GestureTapCallback tap;
  final String nom;
  final String details;
  final double cote;
  const PlatMenu(
      {super.key,
      this.cote = 1,
      required this.details,
      required this.nom,
      required this.tap});

  @override
  State<PlatMenu> createState() => _PlatMenuState();
}

class _PlatMenuState extends State<PlatMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity, // Prendre toute la largeur
              height: 200,
              child: Image.asset(
                ImagePaths.pizza,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.nom,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.5,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(IconsPath.start),
                        color: MyColors.primary,
                      ),
                      Text(
                        "${widget.cote}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primary),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.details,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
