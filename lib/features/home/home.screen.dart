import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/home/home.actions.dart';
import 'package:izpi_exchange/features/home/home.widgets.dart';
import 'package:izpi_exchange/services/gateway.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Product> products = [];

  final gateway = GatewayService();

  @override
  Widget build(BuildContext context) {
    return MainLayout(body: _buildChildWidget(), title: 'Inicio');
  }

  @override
  void dispose() {
    gateway.off('PRODUCT_PUBLISHED');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _initializeProducts();
    _initializeSocket();
  }

  Widget _buildChildWidget() {
    if (isLoading) {
      return HomeProductsLoadingState();
    }

    if (products.isEmpty) {
      return HomeProductsEmptyState();
    }

    return ListView.separated(
      itemBuilder: (_, index) => HomeProductItem(product: products[index]),
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
    );
  }

  void _initializeProducts() async {
    final data = await getPublishedProducts(context);

    setState(() {
      products = data;
      isLoading = false;
    });
  }

  void _initializeSocket() async {
    gateway.on('PRODUCT_PUBLISHED', (data) {
      if (mounted) {
        setState(() {
          products.add(Product.fromJson(data));
        });
      }
    });
  }
}
