import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Text('Próximamente...', style: defaultFont(fontWeight: FontWeight.bold)),
      title: 'Chats',
    );
  }
}
