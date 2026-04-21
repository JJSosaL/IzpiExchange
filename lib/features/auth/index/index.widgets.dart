import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/button.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('¡Bienvenido!', style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class AuthSignInButton extends StatelessWidget {
  const AuthSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      content: 'Iniciar Sesión',
      onPressed: () => context.push('/auth/sign-in'),
      variant: ButtonVariant.outline,
    );
  }
}

class AuthSignUpButton extends StatelessWidget {
  const AuthSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      content: 'Crear Cuenta',
      onPressed: () => context.push('/auth/sign-up'),
      variant: ButtonVariant.filled,
    );
  }
}
