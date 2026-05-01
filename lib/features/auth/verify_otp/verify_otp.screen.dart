import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.actions.dart';
import 'package:izpi_exchange/features/auth/verify_otp/verify_otp.widgets.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

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
              _getTitleWidget(),
              _getDescriptionWidget(),
              _getTextInputWidget(),
              _getButtonWidget(),
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
    return VerifyOtpButton(onPressed: isLoading ? null : _submitData);
  }

  Widget _getDescriptionWidget() {
    return const VerifyOtpDescription();
  }

  Widget _getTextInputWidget() {
    return VerifyOtpCodeInput(controller: otpController);
  }

  Widget _getTitleWidget() {
    return const VerifyOtpTitle();
  }

  Future<void> _submitData() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final otpAction = widget.action.toUpperCase();
      final otpCode = otpController.text;

      final response = await createVerifySignUpOtpRequest(otpCode, otpAction, context);

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
