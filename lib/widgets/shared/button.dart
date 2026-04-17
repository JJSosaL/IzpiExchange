import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String content;
  final VoidCallback onPressed;
  final ButtonWidgetVariant variant;

  const ButtonWidget({
    super.key,
    required this.content,
    required this.onPressed,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle();

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          content,
          style: GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    );
    OutlinedBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    );

    switch (variant) {
      case ButtonWidgetVariant.filled:
        {
          return TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: padding,
            shape: shape,
          );
        }
      case ButtonWidgetVariant.outline:
        {
          return TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: padding,
            shape: shape,
            side: const BorderSide(color: Colors.black, width: 2),
          );
        }
    }
  }
}

enum ButtonWidgetVariant { filled, outline }
