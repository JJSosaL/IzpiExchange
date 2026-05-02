import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

enum AlertVariant { danger, info, warning }

class SharedAlert extends StatelessWidget {
  const SharedAlert({super.key, required this.content, required this.variant});

  static final Map<AlertVariant, Color> _colorMap = {
    AlertVariant.danger: Colors.red.shade200,
    AlertVariant.info: Colors.grey.shade200,
    AlertVariant.warning: Colors.amber.shade100,
  };

  final String content;
  final AlertVariant variant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: _getDecoration(),
        child: Padding(padding: const EdgeInsets.all(15), child: _getTextWidget()),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(borderRadius: BorderRadius.circular(15), color: _colorMap[variant]);
  }

  Widget _getTextWidget() {
    return Text(content, maxLines: null, style: defaultFontStyle(fontSize: 12.5, fontWeight: FontWeight.bold));
  }
}
