import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class PlatPanier extends StatefulWidget {
  bool isChecked;
  GestureTapCallback tap;
  Panier panier;
  PlatPanier(
      {super.key,
      required this.panier,
      this.isChecked = false,
      required this.tap});

  @override
  State<PlatPanier> createState() => _PlatPanierState();
}

class _PlatPanierState extends State<PlatPanier> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.isChecked)
                    InkWell(
                      onTap: widget.tap,
                      child: Container(
                        //height: 30,
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.primary, width: 2),
                        ),
                        child: Icon(Icons.check, size: 25, color: Colors.white),
                      ),
                    ),
                  if (!widget.isChecked)
                    InkWell(
                      onTap: widget.tap,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.primary, width: 2),
                        ),
                        child: Padding(padding: EdgeInsets.all(10)),
                      ),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    widget.panier.plat!.photo,
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextTitle(
                        title: widget.panier.plat!.nom,
                        fontSize: 15,
                      ),
                      SizedBox(height: 3),
                      Text("Qte : ${widget.panier.qte}"),
                      SizedBox(height: 3),
                      Text("${widget.panier.prix} FC"),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }
}
