import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/home/home.actions.dart';
import 'package:izpi_exchange/features/home/home.widgets.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
          builder: (context, snapshot) {
            final isLoading = snapshot.connectionState == ConnectionState.waiting;

            if (isLoading) {
              return HomeProductsLoadingState();
            }

            final productList = snapshot.data ?? [];
            final productCount = productList.length;

            if (productList.isEmpty) {
              return HomeProductsEmptyState();
            }

            return ListView.separated(
              itemBuilder: (_, index) => HomeProductItem(product: productList[index]),
              itemCount: productCount,
              separatorBuilder: (_, _) => Divider(
                color: Colors.transparent,
                radius: BorderRadius.circular(999),
                thickness: 2.5,
              ),
            );
          },
          future: getPublishedProducts(context),
        ),
      ),
      title: 'Inicio',
    );
  }
}
