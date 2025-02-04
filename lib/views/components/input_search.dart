import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class InputSearch extends StatefulWidget {
  final double size;
  final GestureTapCallback tap;
  const InputSearch(
      {super.key,
      required this.tap,
      required this.size,});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: widget.tap,
      style: TextStyle(
          color: Colors.black54,
          fontSize: widget.size,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Recherche...",
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: BorderSide(width: 0.0, color: MyColors.inputColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: BorderSide(width: 0.0, color: MyColors.inputColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: BorderSide(width: 0.0, color: MyColors.inputColor)),
      ),
    );
  }
}
