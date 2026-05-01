import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/widgets/layout/alert.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SharedAlert(content: 'Característica en Desarrollo', icon: Icons.build_circle),
      title: 'Chats',
    );
  }
}
