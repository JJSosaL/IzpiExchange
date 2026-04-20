import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.actions.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.widgets.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<StatefulWidget> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              const VerifyOtpTitle(),
              const VerifyOtpDescription(),
              VerifyOtpCodeInput(controller: otpController),
              VerifyOtpButton(
                onPressed: isLoading
                    ? () {
                        null;
                      }
                    : _handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();

    super.dispose();
  }

  SnackBar _buildVerifyOtpSnackBar(String errorMessage) {
    return SnackBar(
      content: Text(errorMessage, style: defaultFont(fontSize: 15, fontWeight: FontWeight.bold)),
      showCloseIcon: true,
    );
  }

  Future<void> _handleSubmit() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    try {
      final otpCode = otpController.text;
      final response = await createVerifySignUpOtpRequest(otpCode, context);

      // Verificar si la respuesta es un mensaje de error.
      if (response is String) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildVerifyOtpSnackBar(response));
        }
      }
    } finally {
      setState(() => isLoading = false);
    }
  }
}
