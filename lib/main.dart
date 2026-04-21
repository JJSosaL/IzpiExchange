import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/core/auth/auth.constants.dart';
import 'package:izpi_exchange/core/auth/auth.storage.dart';
import 'package:izpi_exchange/features/auth/index/index.screen.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.screen.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.screen.dart';
import 'package:izpi_exchange/features/home/home.screen.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final accessToken = await flutterSecureStorage.read(key: accessTokenKey);

    print(accessToken);

    final hasAccessToken = accessToken != null;
    final isAuthenticating = state.matchedLocation.startsWith('/auth/');

    if (!hasAccessToken && !isAuthenticating) {
      return '/auth';
    }

    if (hasAccessToken && isAuthenticating) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(builder: (_, _) => const HomePage(), path: '/'),
    GoRoute(builder: (_, _) => const AuthPage(), path: '/auth'),
    GoRoute(builder: (_, _) => const SignUpPage(), path: '/auth/sign-up'),
    GoRoute(builder: (_, _) => const VerifyOtpPage(), path: '/auth/verify-otp'),
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
