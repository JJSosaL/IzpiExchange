import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.actions.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.widgets.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  bool isLoading = false;

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
              SignUpSubmitButton(onPressed: isLoading ? null : _handleSubmit),
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

  SnackBar _buildSignUpSnackBar(String errorMessage) {
    return SnackBar(
      content: Text(errorMessage, style: defaultFont(fontSize: 15, fontWeight: FontWeight.bold)),
      showCloseIcon: true,
    );
  }

  Future<void> _handleSubmit() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    try {
      final email = emailController.text;
      final response = await createSignUpRequest(email, context);

      if (response is String) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildSignUpSnackBar(response));
        }
      }
    } finally {
      setState(() => isLoading = false);
    }
  }
}
