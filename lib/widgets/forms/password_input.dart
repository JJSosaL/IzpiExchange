import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInputWidget extends StatefulWidget {
  final String label;

  const PasswordInputWidget({super.key, required this.label});

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
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),

          labelStyle: GoogleFonts.bricolageGrotesque(
            color: Colors.black,

            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          labelText: widget.label,

          suffixIcon: IconButton(icon: _getIcon(), onPressed: _handleObscure),
        ),
        obscureText: _obscure,
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
