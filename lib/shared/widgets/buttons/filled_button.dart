import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class SharedFilledButton extends StatelessWidget {
  const SharedFilledButton({super.key, required this.content, required this.onPressed});

  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(content, style: defaultFont(fontWeight: FontWeight.bold)),
    );
  }
}
