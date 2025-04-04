import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jenos_app/utils/colors.dart';

class InputLocationSearch extends StatefulWidget {
  const InputLocationSearch({super.key});

  @override
  State<InputLocationSearch> createState() => _InputLocationSearchState();
}

class _InputLocationSearchState extends State<InputLocationSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.white,
        suffixIcon: Icon(
          Icons.location_searching_sharp,
        ),
        prefixIcon: Icon(Icons.location_on_sharp, color: MyColors.primary,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
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
    );
  }
}
