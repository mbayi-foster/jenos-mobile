import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class MyInput extends StatefulWidget {
  final String hint;
  final int ligne;
  final bool radius;
  final TextInputType keyboardType;
  final double size;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final VoidCallback? showPasswordOnTap;
  final bool showPassword;

  const MyInput(
      {super.key,
      this.radius = true,
      this.showPassword = false,
      this.isPassword = false,
      this.showPasswordOnTap,
      this.size = 15,
      this.ligne = 1,
      this.validator,
      required this.hint,
      required this.onSaved,
      required this.keyboardType});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.ligne,
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: (widget.isPassword) ? widget.showPassword : false,
      keyboardType: widget.keyboardType,
      style: TextStyle(
          color: Colors.black54,
          fontSize: widget.size,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: widget.showPasswordOnTap,
                icon: Icon(
                  widget.showPassword ? Icons.visibility : Icons.visibility_off,
                  color: (!widget.showPassword)
                      ? MyColors.primary
                      : Colors.black45,
                ),
              )
            : null,
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.grey[300],
        enabledBorder: OutlineInputBorder(
            borderRadius: (widget.radius)
                ? BorderRadius.circular(75)
                : BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: (widget.radius)
                ? BorderRadius.circular(75)
                : BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
        border: OutlineInputBorder(
            borderRadius: (widget.radius)
                ? BorderRadius.circular(75)
                : BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 0.0, color: MyColors.inputColor)),
      ),
    );
  }
}
