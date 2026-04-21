import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/button.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Crear Cuenta', style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class SignUpEmailInput extends StatelessWidget {
  const SignUpEmailInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(controller: controller, label: 'Correo Eletrónico');
  }
}

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(content: 'Crear Cuenta', onPressed: onPressed, variant: ButtonVariant.filled);
  }
}
