import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

enum SnackBarVariant { error, success }

class SharedSnackBar {
  static final Map<SnackBarVariant, Color> _colorMap = {
    SnackBarVariant.error: Colors.red.shade200,
    SnackBarVariant.success: Colors.green.shade200,
  };

  static SnackBar build(String content, {required SnackBarVariant variant}) {
    return SnackBar(
      backgroundColor: _colorMap[variant],
      closeIconColor: Colors.black,
      content: Text(
        content,
        style: defaultFontStyle(color: Colors.black, fontSize: 12.5, fontWeight: FontWeight.bold),
      ),
      showCloseIcon: true,
    );
  }
}
