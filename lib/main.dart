import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/core/auth/auth.constants.dart';
import 'package:izpi_exchange/core/auth/auth.storage.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/features/auth/index/index.screen.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.screen.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.screen.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.screen.dart';
import 'package:izpi_exchange/features/home/home.screen.dart';
import 'package:izpi_exchange/features/upgrade_required/upgrade_required.screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<bool> shouldUpgradeVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final packageInfoVersion = packageInfo.version;

  final requestUri = createRequestUri('check');
  final requestBody = {'version': packageInfoVersion};

  //final response = await post(requestUri, body: requestBody);
  //final responseBody = jsonDecode(response.body);

  //final shouldUpgrade = bool.parse(responseBody['shouldUpgrade']);

  return true;
}

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final accessToken = await flutterSecureStorage.read(key: accessTokenKey);

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
    GoRoute(builder: (_, _) => const SignInPage(), path: '/auth/sign_in'),
    GoRoute(builder: (_, _) => const SignUpPage(), path: '/auth/sign_up'),
    GoRoute(
      builder: (context, state) {
        final action = state.pathParameters['action']!;

        return VerifyOtpPage(action: action);
      },
      redirect: (context, state) {
        final action = state.pathParameters['action'];

        if (action == null || action.isEmpty) {
          return '/auth';
        }

        return null;
      },
      path: '/auth/verify_otp/:action',
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const domain = 'izpiexchange.fancystudio.xyz';
  final shouldUpgrade = await shouldUpgradeVersion();

  runApp(IzpiExchangeApp(domain: domain, shouldUpgrade: shouldUpgrade));
}

class IzpiExchangeApp extends StatelessWidget {
  const IzpiExchangeApp({super.key, required this.domain, required this.shouldUpgrade});

  final String domain;
  final bool shouldUpgrade;
  final String title = 'IzpiExchange';

  @override
  Widget build(BuildContext context) {
    if (shouldUpgrade) {
      return _createUpgradeRequiredApp();
    }

    return _createGoRouterApp();
  }

  MaterialApp _createUpgradeRequiredApp() {
    return MaterialApp(
      home: UpgradeRequiredPage(domain: domain),
      theme: _getThemeData(),
      title: title,
    );
  }

  MaterialApp _createGoRouterApp() {
    return MaterialApp.router(routerConfig: router, theme: _getThemeData(), title: title);
  }

  ThemeData _getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.light(primary: Colors.black, surface: Colors.white),
      primaryColor: Colors.black,
    );
  }
}
