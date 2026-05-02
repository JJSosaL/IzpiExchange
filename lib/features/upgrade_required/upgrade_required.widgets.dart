import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class UpgradeRequiredTitle extends StatelessWidget {
  const UpgradeRequiredTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Actualización Requerida', style: defaultFontStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class UpgradeRequiredDescription extends StatelessWidget {
  const UpgradeRequiredDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Se ha detectado una nueva versión disponible de la aplicación.',
      style: defaultFontStyle(color: Colors.grey.shade900, fontSize: 15, fontWeight: FontWeight.normal),
    );
  }
}

class UpgradeRequiredButton extends StatelessWidget {
  const UpgradeRequiredButton({super.key, required this.domain});

  final String domain;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(content: 'Descargar Actualización', onPressed: _openBrowserWithWebsite),
    );
  }

  Future<void> _openBrowserWithWebsite() async {
    await launchUrl(Uri.https(domain), mode: LaunchMode.externalApplication);
  }
}
