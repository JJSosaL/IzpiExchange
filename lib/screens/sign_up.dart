import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:izpi_exchange/widgets/forms/text_input.dart";
import "package:izpi_exchange/widgets/shared/button.dart";
import "package:izpi_exchange/widgets/forms/password_input.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              const TextInputWidget(label: "Correo Electrónico"),
              const PasswordInputWidget(label: "Contraseña"),
              const SignUpSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Crear Cuenta",
      style: GoogleFonts.bricolageGrotesque(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      content: "Crear Cuenta",
      onPressed: () {},
      variant: ButtonWidgetVariant.filled,
    );
  }
}
