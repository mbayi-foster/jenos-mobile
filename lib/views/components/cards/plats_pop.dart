import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class PlatsPop extends StatefulWidget {
  final String offre;
  final double width;
  final double heigth;
  final GestureTapCallback tap;
  final BoxFit fit;
  final Plat plat;
  const PlatsPop(
      {super.key,
      required this.offre,
      required this.tap,
      this.heigth = 150,
      this.width = 250,
      required this.plat,
      this.fit = BoxFit.contain});

  @override
  State<PlatsPop> createState() => _PlatsPopState();
}

class _PlatsPopState extends State<PlatsPop> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: SizedBox(
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Bords arrondis
              ),
              height: widget.heigth,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    widget.plat.photo,
                    fit: widget.fit,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        ImagePaths
                            .error, // Remplace par le chemin de ton image de remplacement
                        fit: BoxFit
                            .cover, // Ajustement de l'image de remplacement
                      );
                    },
                  )),
            ),
            TextTitle(title: widget.plat.nom),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${widget.plat.prix} FC",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  width: 7.5,
                ),
                const ImageIcon(
                  AssetImage(IconsPath.start),
                  color: MyColors.primary,
                ),
                Text(
                  "4.9",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
