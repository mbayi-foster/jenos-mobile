import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';

class MenuItem extends StatefulWidget {
  final String image;
  final Menu menu;
  final GestureTapCallback tap;
  const MenuItem({
    super.key,
    required this.menu,
    required this.tap,
    required this.image,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          // La Card en arrière-plan
          const SizedBox(
            width: double.infinity,
            height: 100,
            child: Center(child: Text('Card')),
          ),

          // Widget positionné au-dessus de la Card
          Positioned(
              left: 25,
              right: 25, // Positionné à l'extrême gauche, ajusté pour dépasser
              top: 0,
              bottom: 0, // Ajuster la position verticale
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(300.0),
                  bottomLeft: Radius.circular(300.0),
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.menu.nom,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.menu.count} ${LocalisationService.of(context)!.translate("menu.plat")}",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            left: 5, // Positionné à l'extrême gauche, ajusté pour dépasser
            top: 15, // Ajuster la position verticale
            child: Container(
                width: 70, // Largeur du widget
                height: 70,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(200)),
                  child: Image.network(
                    widget.menu.photo,
                    height: double.infinity,
                    width: double.infinity,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        ImagePaths
                            .error, // Remplace par le chemin de ton image de remplacement
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit
                            .cover, // Ajustement de l'image de remplacement
                      );
                    },
                  ),
                )),
          ),
          Positioned(
            right: 10, // Positionné à l'extrême gauche, ajusté pour dépasser
            top: 27, // Ajuster la position verticale
            child: Center(
              child: Material(
                elevation: 4, // Élévation pour donner de la profondeur
                shape: const CircleBorder(), // Forme circulaire
                child: InkWell(
                  borderRadius: BorderRadius.circular(30), // Arrondir les coins
                  onTap: widget.tap,
                  child: ClipOval(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(8), // Espace autour de l'icône
                      child: const Icon(
                        Icons.arrow_forward_ios, // Icône à afficher
                        size: 30,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
