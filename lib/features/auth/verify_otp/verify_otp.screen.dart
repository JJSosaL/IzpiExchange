import 'package:flutter/material.dart';
import 'package:izpi_exchange/features/verify_otp/verify_otp.widgets.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<StatefulWidget> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final otpController = TextEditingController();

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
              const VerifyOtpTitle(),
              const VerifyOtpDescription(),
              VerifyOtpCodeInput(otpController: otpController),
            ],
          ),
        ),
      ),
    );
  }
}
