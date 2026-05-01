import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class SharedTextInput extends StatelessWidget {
  const SharedTextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: _getInputDecoration(),
        keyboardType: keyboardType,
        style: defaultFontStyle(),
      ),
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      border: _getInputDecorationBorder(),
      labelStyle: _getLabelStyle(),
      labelText: label,
    );
  }

  OutlineInputBorder _getInputDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(999),
      borderSide: const BorderSide(width: 1),
    );
  }

  TextStyle _getLabelStyle() {
    return defaultFontStyle(fontSize: 15, fontWeight: FontWeight.normal);
  }
}
