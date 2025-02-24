import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class MyInput extends StatefulWidget {
  final String hint;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final double size;
  final bool isPassword;
  final String? Function(String?)? validator;

  const MyInput(
      {super.key,
      this.isPassword = false,
      this.size = 15,
      this.validator,
      required this.hint,
      required this.ctrl,
      required this.keyboardType});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ctrl,
      validator: widget.validator,
      obscureText: widget.isPassword,
      keyboardType: widget.keyboardType,
      style: TextStyle(
          color: Colors.black54,
          fontSize: widget.size,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: const BorderSide(width: 0.0, color: MyColors.inputColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: const BorderSide(width: 0.0, color: MyColors.inputColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: const BorderSide(width: 0.0, color: MyColors.inputColor)),
      ),
    );
  }
}
