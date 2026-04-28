import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/features/auth/index/index.screen.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.screen.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.screen.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.screen.dart';
import 'package:izpi_exchange/features/home/home.screen.dart';
import 'package:izpi_exchange/features/upgrade_required/upgrade_required.screen.dart';
import 'package:izpi_exchange/services/gateway.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

final logger = Logger();

Future<bool> shouldUpgradeVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final packageInfoVersion = packageInfo.version;

  final requestUri = createRequestUri('api/check-version');
  final requestBody = {'version': packageInfoVersion};

  final response = await post(requestUri, body: requestBody);
  final responseData = jsonDecode(response.body);

  final shouldUpgrade = responseData['shouldUpgrade'];

  return shouldUpgrade;
}

final router = GoRouter(
  routes: [
    GoRoute(builder: (_, _) => const HomePage(), path: '/'),
    GoRoute(builder: (_, _) => const AuthPage(), path: '/auth'),
    GoRoute(builder: (_, _) => const SignInPage(), path: '/auth/sign_in'),
    GoRoute(builder: (_, _) => const SignUpPage(), path: '/auth/sign_up'),
    GoRoute(
      builder: (context, state) {
        final action = state.pathParameters['action']!;

        return VerifyOtpPage(action: action);
      },
      path: '/auth/verify_otp/:action',
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final shouldUpgrade = await shouldUpgradeVersion();

  await GatewayService().init();

  runApp(IzpiExchangeApp(shouldUpgrade: shouldUpgrade));
}

class IzpiExchangeApp extends StatefulWidget {
  const IzpiExchangeApp({super.key, required this.shouldUpgrade});

  final bool shouldUpgrade;

  @override
  State<IzpiExchangeApp> createState() => _IzpiExchangeAppState();
}

class _IzpiExchangeAppState extends State<IzpiExchangeApp> {
  late final StreamSubscription authSubscription;

  @override
  Widget build(BuildContext context) {
    if (widget.shouldUpgrade) {
      return MaterialApp(home: UpgradeRequiredPage(domain: 'izpiexchange.fancystudio.xyz'));
    }

    return MaterialApp.router(routerConfig: router, theme: _getThemeData());
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    authSubscription = GatewayService().authStream.listen((state) {
      switch (state) {
        case AuthState.failed:
          router.go('/auth');

          break;
        case AuthState.authenticated:
          router.go('/');

          break;
      }
    });
  }

  ThemeData _getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.light(primary: Colors.black, surface: Colors.white),
      primaryColor: Colors.black,
    );
  }
}
