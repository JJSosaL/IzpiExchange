import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Crear Cuenta', style: defaultFontStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class SignUpEmailInput extends StatelessWidget {
  const SignUpEmailInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SharedTextInput(controller: controller, keyboardType: TextInputType.emailAddress, label: 'Correo Electrónico');
  }
}

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(content: 'Crear Cuenta', onPressed: onPressed),
    );
  }
}
