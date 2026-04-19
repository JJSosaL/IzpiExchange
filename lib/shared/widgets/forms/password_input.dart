import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  State<PasswordInputWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInputWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          labelStyle: defaultFont(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          labelText: widget.label,
          suffixIcon: IconButton(icon: _getIcon(), onPressed: _handleObscure),
        ),
        obscureText: _obscure,
        style: defaultFont(color: Colors.black),
      ),
    );
  }

  Icon _getIcon() {
    return Icon(_obscure ? Icons.visibility_off : Icons.visibility);
  }

  void _handleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}
