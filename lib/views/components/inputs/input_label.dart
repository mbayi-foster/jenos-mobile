import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class InputLabel extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final double size;
  final bool isPassword;
  final bool edit;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  const InputLabel(
      {super.key,
      required this.onSaved,
      this.isPassword = false,
      this.edit = true,
      this.size = 15,
      this.validator,
      required this.hint,
      required this.label,
      required this.ctrl,
      required this.keyboardType});

  @override
  State<InputLabel> createState() => _InputLabelState();
}

class _InputLabelState extends State<InputLabel> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      readOnly: widget.edit,
      controller: widget.ctrl,
      validator: widget.validator,
      obscureText: widget.isPassword,
      keyboardType: widget.keyboardType,
      style: TextStyle(
          color: Colors.black54,
          fontSize: widget.size,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
        ),
        hintText: widget.hint,
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
