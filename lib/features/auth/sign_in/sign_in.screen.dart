import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.actions.dart';
import 'package:izpi_exchange/features/auth/sign_in/sign_in.widgets.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

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
            children: [_getTitleWidget(), _getTextInputWidget(), _getButtonWidget()],
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

  SnackBar _buildSnackBar(String errorMessage) {
    return SnackBar(
      content: Text(
        errorMessage,
        style: defaultFontStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      persist: false,
      showCloseIcon: true,
    );
  }

  Widget _getButtonWidget() {
    return SignInSubmitButton(onPressed: isLoading ? null : _submitData);
  }

  Widget _getTextInputWidget() {
    return SignInEmailInput(controller: emailController);
  }

  Widget _getTitleWidget() {
    return const SignInTitle();
  }

  Future<void> _submitData() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final email = emailController.text;
      final response = await createSignInRequest(email, context);

      if (!response.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(response.message));
        }
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
