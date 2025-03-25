import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class InfoItem extends StatefulWidget {
  final String icon;
  final String text;
  final GestureTapCallback tap;
  final int notifications;
  const InfoItem(
      {super.key,
      this.notifications = 0,
      required this.icon,
      required this.text,
      required this.tap});

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.tap,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
            ),
            Positioned(
              right: 2, // Positionné à l'extrême gauche, ajusté pour dépasser
              top: 27, // Ajuster la position verticale
              child: Center(
                child: Material(
                  elevation: 4, // Élévation pour donner de la profondeur
                  shape: CircleBorder(), // Forme circulaire
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(30), // Arrondir les coins
                    onTap: widget.tap,
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5), // Espace autour de l'icône
                        child: Icon(
                          Icons.arrow_forward_ios, // Icône à afficher
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 20,
              right: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              padding: const EdgeInsets.all(20.0),
                              child: ImageIcon(
                                AssetImage(widget.icon),
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            TextTitle(title: widget.text, fontSize: 15,)
                          ],
                        ),
                        if (widget.notifications >= 1)
                          ClipOval(
                            child: Container(
                                color: MyColors.primary,
                                padding: const EdgeInsets.all(
                                    5), // Espace autour de l'icône
                                child: Text(
                                  "${widget.notifications}",
                                  style: const TextStyle(
                                    color: Colors.white, 
                                    fontSize: 12),
                                )),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
