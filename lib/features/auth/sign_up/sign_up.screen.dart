import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.actions.dart';
import 'package:izpi_exchange/features/auth/sign_up/sign_up.widgets.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

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
    return SignUpSubmitButton(onPressed: isLoading ? null : _submitData);
  }

  Widget _getTextInputWidget() {
    return SignUpEmailInput(controller: emailController);
  }

  Widget _getTitleWidget() {
    return const SignUpTitle();
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
      final response = await createSignUpRequest(email, context);

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
