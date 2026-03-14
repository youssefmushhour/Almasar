import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  final String hintText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
