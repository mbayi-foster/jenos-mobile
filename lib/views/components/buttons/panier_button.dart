import 'package:flutter/material.dart';

class PanierButton extends StatefulWidget {
  const PanierButton({super.key});

  @override
  State<PanierButton> createState() => _PanierButtonState();
}

class _PanierButtonState extends State<PanierButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.shopping_basket));
  }
}
