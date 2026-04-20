import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/features/auth/sign_up.actions.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/button.dart';
import 'package:izpi_exchange/shared/widgets/forms/password_input.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              const SignUpTitle(),
              TextInputWidget(controller: emailController, label: 'Correo Electrónico'),
              PasswordInputWidget(controller: passwordController, label: 'Contraseña'),
              SignUpSubmitButton(onPressed: _handleSubmit),
            ],
          ),
        ),
      ),
    );
  }

  /*
    Eliminamos los recursos una vez que el widget haya dejado de existir.
  */
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = emailController.text;
    final password = passwordController.text;

    final response = await signUp(email, password);

    if (!mounted) return;

    if (response.success) {
      return context.go('/verify-otp');
    } else {
      String message = response.message;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(message, style: defaultFont(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          persist: false,
          showCloseIcon: true,
        ),
      );
    }
  }
}

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Crear Cuenta', style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      content: 'Crear Cuenta',
      onPressed: onPressed,
      variant: ButtonWidgetVariant.filled,
    );
  }
}
