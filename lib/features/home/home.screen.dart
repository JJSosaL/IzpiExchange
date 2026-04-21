import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/core/auth/auth.storage.dart';
import 'package:izpi_exchange/shared/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Button(
            content: 'Delete Session',
            onPressed: () async {
              await flutterSecureStorage.deleteAll();
              context.go('/');
            },
            variant: ButtonVariant.filled,
          ),
        ),
      ),
    );
  }
}
