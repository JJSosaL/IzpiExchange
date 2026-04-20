import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,

    required this.content,
    required this.onPressed,
    required this.variant,
  });

  final String content;
  final VoidCallback onPressed;
  final ButtonWidgetVariant variant;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle();

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(content, style: defaultFont(fontWeight: FontWeight.bold)),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
    OutlinedBorder shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(999));

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
            side: const BorderSide(color: Colors.black, width: 1),
          );
        }
    }
  }
}

enum ButtonWidgetVariant { filled, outline }
