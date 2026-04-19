import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/features/auth/sign_up.screen.dart';
import 'package:izpi_exchange/features/home/home.screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(builder: (context, state) => const HomePage(), path: '/'),
    GoRoute(builder: (context, state) => const SignUpPage(), path: '/sign-up'),
  ],
);

/*
  Punto de entrada de la aplicación de Flutter.
  Utiliza la función 'runApp' para iniciar el motor de renderizado,
*/
void main() {
  runApp(const IzpiExchangeApp());
}

class IzpiExchangeApp extends StatelessWidget {
  const IzpiExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.black, surface: Colors.white),
        primaryColor: Colors.black,
      ),
      title: 'IzpiExchange',
    );
  }
}
