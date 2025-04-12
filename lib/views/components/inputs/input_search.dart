import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';

class InputSearch extends StatefulWidget {
  final double size;
  final String title;
  final GestureTapCallback? tap;
  final bool readOnly;
  final bool autoFocus;
  final ValueChanged? onChange;
  const InputSearch(
      {super.key,
      this.autoFocus = false,
      this.onChange,
      this.tap,
      this.size = 15,
      this.title = "home.search",
      this.readOnly = true});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      onChanged: widget.onChange,
      readOnly: widget.readOnly,
      onTap: widget.tap,
      style: TextStyle(
          color: Colors.black54,
          fontSize: widget.size,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: LocalisationService.of(context)!.translate(widget.title),
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
    );
  }
}
