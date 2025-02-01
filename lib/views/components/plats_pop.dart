import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/text_title.dart';

class PlatsPop extends StatefulWidget {
  final String offre;
  final double width;
  final double heigth;
  final GestureTapCallback tap;
  final BoxFit fit;
  const PlatsPop(
      {super.key,
      required this.offre,
      required this.tap,
      this.heigth = 100,
      this.width = 100,
      this.fit = BoxFit.contain});

  @override
  State<PlatsPop> createState() => _PlatsPopState();
}

class _PlatsPopState extends State<PlatsPop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.tap,
      child: Container(
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
                  child: Image.asset(
                    ImagePaths.pizza,
                    fit: widget.fit,
                  )),
            ),
            TextTitle(title: "Orangina"),
            Row(
              children: [
                ImageIcon(
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
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    "Ajoutez vos coordonnées pour vous connecter",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
