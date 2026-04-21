import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:izpi_exchange/shared/widgets/buttons/outline_button.dart';

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
    return SizedBox(
      width: double.infinity,
      child: SharedOutlinedButton(
        content: 'Iniciar Sesión',
        onPressed: () => context.push('/auth/sign-in'),
      ),
    );
  }
}

class AuthSignUpButton extends StatelessWidget {
  const AuthSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(
        content: 'Crear Cuenta',
        onPressed: () => context.push('/auth/sign-up'),
      ),
    );
  }
}
