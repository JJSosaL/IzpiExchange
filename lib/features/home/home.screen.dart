import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/core/auth/auth.constants.dart';
import 'package:izpi_exchange/core/auth/auth.storage.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/features/home/home.actions.dart';
import 'package:izpi_exchange/features/home/home.widgets.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  late io.Socket socket;
  List products = [];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: _buildChild()),
      title: 'Inicio',
    );
  }

  @override
  void dispose() {
    if (socket.connected) {
      socket.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _initializeProducts();
    _initializeSocket();
  }

  Widget _buildChild() {
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
    final authorization = await flutterSecureStorage.read(key: accessTokenKey);

    if (authorization == null) {
      if (mounted) {
        return context.go('auth');
      }
    }

    socket = io.io(
      createRequestUri('products').toString(),
      io.OptionBuilder().setTransports(['websocket']).setAuth({
        'accessToken': authorization,
      }).build(),
    );

    socket.onConnect((_) => print('Aplicación conectada al gateway'));
    socket.onDisconnect((_) => print('Aplicación desconectada del gateway'));

    socket.on('PRODUCT_CREATED', (data) {
      if (!mounted) return;

      setState(() => products.add(Product.fromJson(data)));
    });
  }
}
