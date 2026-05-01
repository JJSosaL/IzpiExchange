import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class SharedTextInput extends StatelessWidget {
  const SharedTextInput({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: _getInputDecoration(),
        style: defaultFontStyle(color: Colors.black),
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
      borderSide: const BorderSide(color: Colors.black, width: 1),
    );
  }

  TextStyle _getLabelStyle() {
    return defaultFontStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal);
  }
}
