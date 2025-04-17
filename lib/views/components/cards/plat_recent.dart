import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class PlatRecent extends StatefulWidget {
  final GestureTapCallback tap;
  final Plat plat;
  const PlatRecent({
    super.key,
    required this.tap,
    required this.plat,
  });

  @override
  State<PlatRecent> createState() => _PlatRecentState();
}

class _PlatRecentState extends State<PlatRecent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.tap,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Bords arrondis
              ),
              height: 100,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    widget.plat.photo,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        ImagePaths
                            .error, // Remplace par le chemin de ton image de remplacement
                        fit: BoxFit
                            .cover, // Ajustement de l'image de remplacement
                      );
                    },
                    /* errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Text('Erreur de chargement de l\'image');
                    }, */
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 20.00,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTitle(title: widget.plat.nom),
                const SizedBox(
                  height: 2.5,
                ),
                Text(
                  "${widget.plat.prix} Fc",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(IconsPath.start),
                      color: MyColors.primary,
                    ),
                    Text(
                      "4.9",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
