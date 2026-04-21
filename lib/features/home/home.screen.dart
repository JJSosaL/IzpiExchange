import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/home/home.widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeHeader());
  }
}
