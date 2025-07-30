import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
  });
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x000000ff)),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          prefixIconColor: Color(0xff877986),
          prefixIcon: Icon(widget.prefixIcon, size: 28),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon:
                obscureText
                    ? Icon(Icons.remove_red_eye_rounded)
                    : Icon(Icons.remove_red_eye_rounded),
          ),
          filled: true,
          fillColor: Color(0xffEFE4F3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
