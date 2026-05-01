import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/index/index.widgets.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [_getTitleWidget(), _getSignInButtonWidget(), _getSignUpButtonWidget()],
          ),
        ),
      ),
    );
  }

  Widget _getSignInButtonWidget() {
    return const AuthSignInButton();
  }

  Widget _getSignUpButtonWidget() {
    return const AuthSignUpButton();
  }

  Widget _getTitleWidget() {
    return const AuthTitle();
  }
}
