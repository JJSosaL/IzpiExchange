import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class UpgradeRequiredTitle extends StatelessWidget {
  const UpgradeRequiredTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Actualización Requerida',
      style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class UpgradeRequiredDescription extends StatelessWidget {
  const UpgradeRequiredDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Se ha detectado una nueva versión disponible de la aplicación');
  }
}
