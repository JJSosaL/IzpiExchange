import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.actions.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.widgets.dart';
import 'package:izpi_exchange/shared/styles/text.font.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.action});

  final String action;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              const VerifyOtpTitle(),
              const VerifyOtpDescription(),
              VerifyOtpCodeInput(controller: otpController),
              VerifyOtpButton(onPressed: isLoading ? null : _handleSubmit),
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
      persist: false,
      showCloseIcon: true,
    );
  }

  Future<void> _handleSubmit() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    try {
      final otpAction = widget.action.toUpperCase();
      final otpCode = otpController.text;

      final response = await createVerifySignUpOtpRequest(otpCode, otpAction, context);

      if (!response.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildVerifyOtpSnackBar(response.message));
        }
      }
    } finally {
      setState(() => isLoading = false);
    }
  }
}
