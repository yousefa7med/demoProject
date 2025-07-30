import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x000000ff)),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          prefixIconColor: Color(0xff877986),
          prefixIcon: Icon(prefixIcon, size: 28),
          filled: true,
          fillColor: Color(0xffEFE4F3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
