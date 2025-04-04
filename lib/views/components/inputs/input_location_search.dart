import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class InputLocationSearch extends StatefulWidget {
  const InputLocationSearch({super.key, this.onChange, this.tap, this.readOnly = true});
  final GestureTapCallback? tap;
  final ValueChanged? onChange;
  final bool readOnly;
  @override
  State<InputLocationSearch> createState() => _InputLocationSearchState();
}

class _InputLocationSearchState extends State<InputLocationSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onTap: widget.tap,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_on_sharp,
          color: MyColors.primary,
        ),
        suffixIcon: const Icon(Icons.search),
        hintText: "Rechercher un lieu",
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
      ),

      /*   decoration: InputDecoration(
        focusColor: Colors.white,
        suffixIcon: Icon(
          Icons.location_searching_sharp,
        ),
        prefixIcon: Icon(
          Icons.location_on_sharp,
          color: MyColors.primary,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: MyColors.primary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2.0, color: MyColors.primary),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: MyColors.primary),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),

        hintText: "Entrez une adresse",

        //make hint text
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 17.5,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),
      ),
    */
    );
  }
}
