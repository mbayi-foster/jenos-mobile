import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/text_title.dart';

class PlatRecent extends StatefulWidget {
  final GestureTapCallback tap;
  const PlatRecent({
    super.key,
    required this.tap,
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
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    ImagePaths.pizza,
                  )),
            ),
            SizedBox(
              width: 20.00,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTitle(title: "Pizza"),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  "Café . Western Food",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 2.5,
                ),
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
