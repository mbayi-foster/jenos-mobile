import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanierButton extends StatefulWidget {
  final Color colorIcon;
  const PanierButton({super.key, this.colorIcon = Colors.black});

  @override
  State<PanierButton> createState() => _PanierButtonState();
}

class _PanierButtonState extends State<PanierButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.toNamed('panier');
        },
        icon: Icon(
          Icons.shopping_basket,
          color: widget.colorIcon,
        ));
  }
}
