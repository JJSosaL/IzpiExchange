import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.actions.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.widgets.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              const SignInTitle(),
              SignInEmailInput(controller: emailController),
              SignInSubmitButton(onPressed: isLoading ? null : _handleSubmit),
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

  SnackBar _buildSignInSnackBar(String errorMessage) {
    return SnackBar(
      content: Text(errorMessage, style: defaultFont(fontSize: 15, fontWeight: FontWeight.bold)),
      persist: false,
      showCloseIcon: true,
    );
  }

  Future<void> _handleSubmit() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    try {
      final email = emailController.text;
      final response = await createSignInRequest(email, context);

      if (!response.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildSignInSnackBar(response.message));
        }
      }
    } finally {
      setState(() => isLoading = false);
    }
  }
}
