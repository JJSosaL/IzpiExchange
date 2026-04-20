import 'package:flutter/cupertino.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';

class VerifyOtpTitle extends StatelessWidget {
  const VerifyOtpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Verificar Correo', style: defaultFont(fontSize: 30, fontWeight: FontWeight.bold));
  }
}

class VerifyOtpDescription extends StatelessWidget {
  const VerifyOtpDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Te hemos envíado un correo eletrónico con un código de 6 dígitos.',
      style: defaultFont(fontSize: 15, fontWeight: FontWeight.normal),
    );
  }
}

class VerifyOtpCodeInput extends StatelessWidget {
  const VerifyOtpCodeInput({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(controller: otpController, label: "Código OTP");
  }
}
