import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/widgets/layout/alert.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SharedAlert(
        content: 'Esta funcionalidad está bajo desarrollo',
        variant: AlertVariant.info,
      ),
      title: 'Mis Chats',
    );
  }
}
