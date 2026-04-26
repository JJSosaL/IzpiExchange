import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/upgrade_required/upgrade_required.widgets.dart';

class UpgradeRequiredPage extends StatelessWidget {
  const UpgradeRequiredPage({super.key, required this.domain});

  final String domain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [_getTitleWidget(), _getDescriptionWidget(), _getButtonWidget()],
          ),
        ),
      ),
    );
  }

  Widget _getButtonWidget() {
    return UpgradeRequiredButton(domain: domain);
  }

  Widget _getDescriptionWidget() {
    return UpgradeRequiredDescription();
  }

  Widget _getTitleWidget() {
    return UpgradeRequiredTitle();
  }
}
