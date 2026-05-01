import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class SharedTextInput extends StatelessWidget {
  const SharedTextInput({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.label,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: _getInputDecoration(),
        keyboardType: keyboardType,
        maxLines: _getMaxLines(),
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
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1),
    );
  }

  TextStyle _getLabelStyle() {
    return defaultFontStyle(fontSize: 15, fontWeight: FontWeight.normal);
  }

  int? _getMaxLines() {
    return keyboardType == TextInputType.multiline ? null : 1;
  }
}
