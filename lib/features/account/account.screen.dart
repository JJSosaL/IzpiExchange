import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/widgets/layout/alert.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SharedAlert(content: 'Esta funcionalidad está bajo desarrollo', variant: AlertVariant.info),
      title: 'Mi Cuenta',
    );
  }
}
