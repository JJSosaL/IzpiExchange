import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:izpi_exchange/widgets/shared/button.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              const HomeTitle(),
              const HomeSignInButton(),
              const HomeSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bienvenido",
      style: GoogleFonts.bricolageGrotesque(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HomeSignInButton extends StatelessWidget {
  const HomeSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      content: "Iniciar Sesión",
      onPressed: () {
        context.push("/sign-in");
      },
      variant: ButtonWidgetVariant.outline,
    );
  }
}

class HomeSignUpButton extends StatelessWidget {
  const HomeSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      content: "Crear Cuenta",
      onPressed: () {
        context.push("/sign-up");
      },
      variant: ButtonWidgetVariant.filled,
    );
  }
}
