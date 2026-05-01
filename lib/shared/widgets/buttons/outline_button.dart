import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class SharedOutlinedButton extends StatelessWidget {
  const SharedOutlinedButton({super.key, required this.content, required this.onPressed});

  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        content,
        style: defaultFontStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
