import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class SharedAlert extends StatelessWidget {
  const SharedAlert({super.key, required this.content, required this.icon});

  final String content;
  final IconData icon;

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
    return BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.green.shade100);
  }

  Widget _getIconWidget() {
    return Icon(icon, size: 17.5);
  }

  Widget _getTextWidget() {
    return Expanded(
      child: Text(
        content,
        maxLines: null,
        style: defaultFontStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
