import 'package:flutter/material.dart';
import 'package:jenos_app/models/principals/commune.dart';

class MyDropdown extends StatefulWidget {
  MyDropdown(
      {super.key,
      this.communes = const [],
      this.commune,
      required this.onChange});

  List<Commune> communes;
  Commune? commune;
  ValueChanged<Commune?> onChange;

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Commune>(
      decoration: InputDecoration(
        labelText: 'Sélectionnez une commune',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Rayon des bordures
        ),
      ),
      value: widget.commune,
      items: widget.communes.map((Commune item) {
        return DropdownMenuItem<Commune>(
          value: item,
          child: Text(item.nom),
        );
      }).toList(),
      onChanged: widget.onChange,
      validator: (value) {
        if (value == null) {
          return 'Veillez sélectionner une commune';
        }
        return null;
      },
    );
  }
}
