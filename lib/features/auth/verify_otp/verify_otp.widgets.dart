import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class VerifyOtpTitle extends StatelessWidget {
  const VerifyOtpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Verificar Identidad',
      style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class VerifyOtpDescription extends StatelessWidget {
  const VerifyOtpDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Introduce el código de 6 dígitos envíado a tu correo electrónico.',
      style: defaultFont(fontSize: 15, fontWeight: FontWeight.normal),
    );
  }
}

class VerifyOtpCodeInput extends StatelessWidget {
  const VerifyOtpCodeInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(controller: controller, label: 'Código OTP');
  }
}

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(content: 'Verificar Identidad', onPressed: onPressed),
    );
  }
}
