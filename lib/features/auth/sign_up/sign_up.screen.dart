import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.actions.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.widgets.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';
import 'package:izpi_exchange/shared/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              const SignUpTitle(),
              SignUpEmailInput(controller: emailController),
              SignUpSubmitButton(onPressed: _handleSubmit),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = emailController.text;
    final response = await createSignUpRequest(email, context);

    if (response is String) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(response, style: defaultFont(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            persist: false,
            showCloseIcon: true,
          ),
        );
      }
    }
  }
}

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(content: 'Crear Cuenta', onPressed: onPressed, variant: ButtonVariant.filled);
  }
}
