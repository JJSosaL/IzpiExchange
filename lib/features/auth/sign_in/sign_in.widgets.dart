import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Iniciar Sesión', style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class SignInEmailInput extends StatelessWidget {
  const SignInEmailInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(controller: controller, label: 'Correo Electrónico');
  }
}

class SignInSubmitButton extends StatelessWidget {
  const SignInSubmitButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(content: 'Iniciar Sesión', onPressed: onPressed),
    );
  }
}
