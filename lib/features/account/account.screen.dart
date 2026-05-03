import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/account/account.widgets.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SingleChildScrollView(child: Column(spacing: 15, children: [_getActionsSectionWidget()])),
      title: 'Mi Cuenta',
    );
  }

  Widget _getActionsSectionWidget() {
    return const AccountActionsSection();
  }
}
