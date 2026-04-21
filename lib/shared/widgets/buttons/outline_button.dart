import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class SharedOutlinedButton extends StatelessWidget {
  const SharedOutlinedButton({super.key, required this.content, required this.onPressed});

  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(content, style: defaultFont(fontWeight: FontWeight.bold)),
    );
  }
}
