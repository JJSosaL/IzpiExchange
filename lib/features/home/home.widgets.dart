import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/features/home/home.actions.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class HomeProductsLoadingState extends StatelessWidget {
  const HomeProductsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cargando la lista de productos...', style: defaultFontStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}

class HomeProductsEmptyState extends StatelessWidget {
  const HomeProductsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('La lista de productos está vacía...', style: defaultFontStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: AspectRatio(aspectRatio: 1, child: Image.network(product.cover, fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 5, children: [_getPriceWidget(), _getNameWidget()]),
            ),
          ],
        ),
      ),
    );
  }

  Container _getPriceWidget() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(Icons.paid_rounded, size: 15),
            Text(product.price.toString(), style: defaultFontStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Text _getNameWidget() {
    return Text(
      product.name,
      overflow: TextOverflow.ellipsis,
      style: defaultFontStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
    );
  }
}
