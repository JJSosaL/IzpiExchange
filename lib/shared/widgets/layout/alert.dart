import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

enum AlertVariant { info, warning }

class SharedAlert extends StatelessWidget {
  const SharedAlert({super.key, required this.content, required this.icon, required this.variant});

  static final Map<AlertVariant, Color> _colorMap = {
    AlertVariant.info: Colors.green.shade100,
    AlertVariant.warning: Colors.amber.shade100,
  };

  final String content;
  final IconData icon;
  final AlertVariant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7.5,
          children: [_getIconWidget(), _getTextWidget()],
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(borderRadius: BorderRadius.circular(15), color: _colorMap[variant]);
  }

  Widget _getIconWidget() {
    return Icon(icon, size: 15);
  }

  Widget _getTextWidget() {
    return Expanded(
      child: Text(
        content,
        maxLines: null,
        style: defaultFontStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
      ),
    );
  }
}
