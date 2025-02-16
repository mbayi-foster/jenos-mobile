import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/text_title.dart';

class Plats extends StatefulWidget {
  final GestureTapCallback tap;
  const Plats({super.key, required this.tap});

  @override
  State<Plats> createState() => _PlatsState();
}

class _PlatsState extends State<Plats> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.tap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity, // Prendre toute la largeur
            height: 170,
            child: Image.asset(
              ImagePaths.pizza,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(title: "Orangina"),
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
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Café . Western Food",
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
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
