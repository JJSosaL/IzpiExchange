import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
        child: Row(children: [_getText(), _getSpacer(), _getBalanceChip()]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _getBalanceChip() {
    return HomeHeaderBalanceChip(balance: '100');
  }

  Spacer _getSpacer() {
    return const Spacer();
  }

  Text _getText() {
    return Text('IzpiExchange', style: defaultFont(fontSize: 25, fontWeight: FontWeight.bold));
  }
}

class HomeHeaderBalanceChip extends StatelessWidget {
  const HomeHeaderBalanceChip({super.key, required this.balance});

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(children: [_getIcon(), _getSeparator(), _getBalance()]),
    );
  }

  Text _getBalance() {
    return Text(balance, style: defaultFont(fontSize: 12.5, fontWeight: FontWeight.bold));
  }

  Icon _getIcon() {
    return const Icon(Icons.account_balance, size: 15);
  }

  SizedBox _getSeparator() {
    return const SizedBox(width: 7.5);
  }
}
