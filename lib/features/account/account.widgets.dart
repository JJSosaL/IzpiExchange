import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/core/storage/storage.constants.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';

class AccountActionsSection extends StatelessWidget {
  const AccountActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 5, children: [_getTitleWidget(), _getLogOutButton(context)]),
        ),
      ),
    );
  }

  Widget _getLogOutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(
        content: 'Cerrar Sesión',
        onPressed: () async {
          await secureStorage.delete(key: secureStorageAccessTokenKey);

          if (context.mounted) {
            context.go('/auth');
          }
        },
      ),
    );
  }

  Widget _getTitleWidget() {
    return Text('Acciones', style: defaultFontStyle(fontSize: 12.5, fontWeight: FontWeight.bold));
  }
}
