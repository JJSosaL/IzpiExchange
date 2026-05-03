import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/widgets/layout/alert.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SharedAlert(content: 'Esta funcionalidad está bajo desarrollo', variant: AlertVariant.info),
      title: 'Mi Bandeja',
    );
  }
}
