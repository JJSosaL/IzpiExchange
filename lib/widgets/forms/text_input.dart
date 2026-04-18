import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({super.key, required this.label});

  final String label;

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
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          labelText: label,
        ),
        style: GoogleFonts.bricolageGrotesque(color: Colors.black),
      ),
    );
  }
}
